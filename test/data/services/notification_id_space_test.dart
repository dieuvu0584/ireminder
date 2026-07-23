import 'package:flutter_test/flutter_test.dart';
import 'package:ireminder/data/services/notification_service.dart';

void main() {
  group('NotificationIdSpace', () {
    test('forReminder round-trips through payloadForId', () {
      expect(
        NotificationIdSpace.payloadForId(NotificationIdSpace.forReminder(5)),
        'reminder:5',
      );
    });

    test('payloadForId returns null for the test-notification sentinel id', () {
      expect(
        NotificationIdSpace.payloadForId(
          NotificationIdSpace.testNotificationId,
        ),
        isNull,
      );
    });

    test('payloadForId returns null for a null id', () {
      expect(NotificationIdSpace.payloadForId(null), isNull);
    });
  });
}
