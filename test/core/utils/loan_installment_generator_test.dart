import 'package:flutter_test/flutter_test.dart';
import 'package:ireminder/core/utils/loan_installment_generator.dart';
import 'package:ireminder/domain/enums/loan_frequency.dart';

void main() {
  group('generateInstallments', () {
    test('monthly: total amount matches installmentAmount * count', () {
      final drafts = generateInstallments(
        startDate: DateTime(2026, 1, 15),
        totalInstallments: 24,
        installmentAmount: 1500000,
        frequency: LoanFrequency.monthly,
      );
      expect(drafts.length, 24);
      final sum = drafts.fold<double>(0, (acc, d) => acc + d.amount);
      expect(sum, 1500000 * 24);
    });

    test('monthly: due dates spaced exactly one month apart on due day', () {
      final drafts = generateInstallments(
        startDate: DateTime(2026, 1, 31),
        totalInstallments: 6,
        installmentAmount: 100,
        frequency: LoanFrequency.monthly,
        dueDayOfMonth: 31,
      );
      expect(drafts[0].dueDate, DateTime(2026, 1, 31));
      expect(drafts[1].dueDate, DateTime(2026, 2, 28)); // clamped
      expect(drafts[2].dueDate, DateTime(2026, 3, 31));
      expect(drafts[3].dueDate, DateTime(2026, 4, 30)); // clamped
      expect(drafts[4].dueDate, DateTime(2026, 5, 31));
      expect(drafts[5].dueDate, DateTime(2026, 6, 30)); // clamped
    });

    test('monthly: rolls year over correctly', () {
      final drafts = generateInstallments(
        startDate: DateTime(2026, 11, 10),
        totalInstallments: 4,
        installmentAmount: 100,
        frequency: LoanFrequency.monthly,
      );
      expect(drafts.map((d) => d.dueDate), [
        DateTime(2026, 11, 10),
        DateTime(2026, 12, 10),
        DateTime(2027, 1, 10),
        DateTime(2027, 2, 10),
      ]);
    });

    test('weekly: due dates exactly 7 days apart', () {
      final drafts = generateInstallments(
        startDate: DateTime(2026, 1, 1),
        totalInstallments: 5,
        installmentAmount: 50,
        frequency: LoanFrequency.weekly,
      );
      for (var i = 1; i < drafts.length; i++) {
        expect(drafts[i].dueDate.difference(drafts[i - 1].dueDate).inDays, 7);
      }
    });

    test('biweekly: due dates exactly 14 days apart', () {
      final drafts = generateInstallments(
        startDate: DateTime(2026, 1, 1),
        totalInstallments: 5,
        installmentAmount: 50,
        frequency: LoanFrequency.biweekly,
      );
      for (var i = 1; i < drafts.length; i++) {
        expect(drafts[i].dueDate.difference(drafts[i - 1].dueDate).inDays, 14);
      }
    });

    test('quarterly: due dates 3 months apart, clamped like monthly', () {
      final drafts = generateInstallments(
        startDate: DateTime(2026, 1, 31),
        totalInstallments: 4,
        installmentAmount: 100,
        frequency: LoanFrequency.quarterly,
        dueDayOfMonth: 31,
      );
      expect(drafts.map((d) => d.dueDate), [
        DateTime(2026, 1, 31),
        DateTime(2026, 4, 30), // clamped
        DateTime(2026, 7, 31),
        DateTime(2026, 10, 31),
      ]);
    });

    test('semiAnnually: due dates 6 months apart', () {
      final drafts = generateInstallments(
        startDate: DateTime(2026, 3, 10),
        totalInstallments: 3,
        installmentAmount: 100,
        frequency: LoanFrequency.semiAnnually,
      );
      expect(drafts.map((d) => d.dueDate), [
        DateTime(2026, 3, 10),
        DateTime(2026, 9, 10),
        DateTime(2027, 3, 10),
      ]);
    });

    test('yearly: due dates 12 months apart, rolling the year over', () {
      final drafts = generateInstallments(
        startDate: DateTime(2026, 11, 10),
        totalInstallments: 3,
        installmentAmount: 100,
        frequency: LoanFrequency.yearly,
      );
      expect(drafts.map((d) => d.dueDate), [
        DateTime(2026, 11, 10),
        DateTime(2027, 11, 10),
        DateTime(2028, 11, 10),
      ]);
    });

    test('installment numbers are sequential starting at 1', () {
      final drafts = generateInstallments(
        startDate: DateTime(2026, 1, 1),
        totalInstallments: 3,
        installmentAmount: 10,
        frequency: LoanFrequency.weekly,
      );
      expect(drafts.map((d) => d.installmentNumber), [1, 2, 3]);
    });
  });
}
