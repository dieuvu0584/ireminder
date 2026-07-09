import 'package:flutter_test/flutter_test.dart';
import 'package:ireminder/core/utils/ai_context_builder.dart';

void main() {
  final now = DateTime(2026, 7, 9);

  final categories = [
    const AiContextCategoryInput(id: 1, name: 'Household'),
    const AiContextCategoryInput(id: 2, name: 'Secret Finance'),
  ];

  final reminders = [
    AiContextReminderInput(
      categoryId: 1,
      title: 'Change AC filter',
      dueDate: now.add(const Duration(days: 5)),
    ),
    AiContextReminderInput(
      categoryId: 2,
      title: 'Pay off secret credit card XYZ-9999',
      dueDate: now.add(const Duration(days: 3)),
    ),
  ];

  final loans = [
    AiContextLoanInput(
      categoryId: 1,
      name: 'Washing machine installment',
      totalInstallments: 6,
      paidInstallments: 2,
      nextDueDate: now.add(const Duration(days: 10)),
    ),
    AiContextLoanInput(
      categoryId: 2,
      name: 'Confidential personal loan ABC Bank',
      totalInstallments: 12,
      paidInstallments: 3,
      nextDueDate: now.add(const Duration(days: 4)),
    ),
    AiContextLoanInput(
      categoryId: null,
      name: 'Uncategorized loan should also be excluded',
      totalInstallments: 4,
      paidInstallments: 1,
      nextDueDate: now.add(const Duration(days: 2)),
    ),
  ];

  test('blocked category data never appears in the built context', () {
    final context = buildAiContext(
      reminders: reminders,
      loans: loans,
      categories: categories,
      allowedCategoryIds: {1}, // category 2 ("Secret Finance") is blocked
      now: now,
    );

    expect(context.contains('Household'), isTrue);
    expect(context.contains('Change AC filter'), isTrue);
    expect(context.contains('Washing machine installment'), isTrue);

    expect(context.contains('Secret Finance'), isFalse);
    expect(context.contains('secret credit card'), isFalse);
    expect(context.contains('Confidential personal loan'), isFalse);
    expect(context.contains('Uncategorized loan'), isFalse);
  });

  test('empty allow-list produces a context with no user data at all', () {
    final context = buildAiContext(
      reminders: reminders,
      loans: loans,
      categories: categories,
      allowedCategoryIds: const {},
      now: now,
    );

    for (final r in reminders) {
      expect(context.contains(r.title), isFalse);
    }
    for (final l in loans) {
      expect(context.contains(l.name), isFalse);
    }
    expect(context.contains('Household'), isFalse);
    expect(context.contains('Secret Finance'), isFalse);
  });

  test('reminders outside the 30-day horizon are excluded', () {
    final farReminder = AiContextReminderInput(
      categoryId: 1,
      title: 'Far future reminder',
      dueDate: now.add(const Duration(days: 45)),
    );
    final pastReminder = AiContextReminderInput(
      categoryId: 1,
      title: 'Already overdue reminder',
      dueDate: now.subtract(const Duration(days: 1)),
    );

    final context = buildAiContext(
      reminders: [farReminder, pastReminder],
      loans: const [],
      categories: categories,
      allowedCategoryIds: {1},
      now: now,
    );

    expect(context.contains('Far future reminder'), isFalse);
    expect(context.contains('Already overdue reminder'), isFalse);
  });

  test('allowing every category surfaces everything', () {
    final context = buildAiContext(
      reminders: reminders,
      loans: loans,
      categories: categories,
      allowedCategoryIds: {1, 2},
      now: now,
    );

    expect(context.contains('Secret Finance'), isTrue);
    expect(context.contains('secret credit card'), isTrue);
    expect(context.contains('Confidential personal loan'), isTrue);
    // Category-less loans are still excluded even when every real
    // category is allowed — there's nothing to match against.
    expect(context.contains('Uncategorized loan'), isFalse);
  });
}
