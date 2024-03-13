import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:result_dart/result_dart.dart';
import 'package:studle/src/core/constants/local_storage_key.dart';
import 'package:studle/src/core/exceptions/exceptions.dart';
import 'package:studle/src/core/extension_types/guid.dart';
import 'package:studle/src/core/services/local_storage/domain/services/i_local_storage_service.dart';
import 'package:studle/src/modules/notifications/data/services/notification_local_service_impl.dart';
import 'package:studle/src/modules/notifications/domain/services/i_notification_service.dart';

import '../../../../../mocks/generated_mocks.mocks.dart';
import '../../../../../mocks/notification_entity_mock.dart' as mock;

void main() {
  late final ILocalStorageService localStorageService;
  late final INotificationService notificationService;

  setUpAll(() {
    localStorageService = MockILocalStorageService();
    notificationService =
        NotificationLocalServiceImpl(localStorageService: localStorageService);
  });

  group('fetch', () {
    test('Success', () async {
      final expectedValue = [mock.entity];

      when(localStorageService.read<String>(LocalStorageKey.notifications))
          .thenAnswer((_) async => Success(mock.jsonReadList));

      final result = await notificationService.fetch();

      expect(result.getOrNull(), expectedValue);
    });

    test('Return empty list when notifications do not exist in local storage',
        () async {
      final expectedValue = [];

      when(localStorageService.read<String>(LocalStorageKey.notifications))
          .thenAnswer((_) async => const Failure(NotFoundException()));

      final result = await notificationService.fetch();

      expect(result.getOrNull(), expectedValue);
    });

    test('Return error if the local storage read method returns error',
        () async {
      when(localStorageService.read<String>(LocalStorageKey.notifications))
          .thenAnswer((_) async => const Failure(UnknowException()));

      final result = await notificationService.fetch();

      expect(result.exceptionOrNull(), isA<UnknowException>());
    });

    test('Return error if local storage method returns a type other than List',
        () async {
      when(localStorageService.read<String>(LocalStorageKey.notifications))
          .thenAnswer((_) async => const Success(''));

      final result = await notificationService.fetch();

      expect(result.exceptionOrNull(), isA<UnknowException>());
    });
  });

  group('markAsRead', () {
    test('Success', () async {
      when(localStorageService.read<String>(LocalStorageKey.notifications))
          .thenAnswer((_) async => Success(mock.jsonUnreadList));

      when(localStorageService.write<String>(
              LocalStorageKey.notifications, any))
          .thenAnswer((_) async => const Success(true));

      final result = await notificationService.markAsRead(mock.entity.id);

      expect(result.getOrNull(), true);
      verify(localStorageService.write<String>(
        LocalStorageKey.notifications,
        any,
      )).called(1);
    });

    test('Return error if the local storage read method returns error',
        () async {
      when(localStorageService.read<String>(LocalStorageKey.notifications))
          .thenAnswer((_) async => const Failure(UnknowException()));

      final result = await notificationService.markAsRead(mock.entity.id);

      expect(result.exceptionOrNull(), isA<UnknowException>());
      verifyNever(localStorageService.write<String>(
        LocalStorageKey.notifications,
        any,
      ));
    });

    test('Return error if the local storage write method returns error',
        () async {
      when(localStorageService.read<String>(LocalStorageKey.notifications))
          .thenAnswer((_) async => Success(mock.jsonUnreadList));

      when(localStorageService.write<String>(
              LocalStorageKey.notifications, any))
          .thenAnswer((_) async => const Failure(UnknowException()));

      final result = await notificationService.markAsRead(mock.entity.id);

      expect(result.exceptionOrNull(), isA<UnknowException>());
      verify(localStorageService.write<String>(
        LocalStorageKey.notifications,
        any,
      )).called(1);
    });

    test('Return error if local storage method returns a type other than List',
        () async {
      when(localStorageService.read<String>(LocalStorageKey.notifications))
          .thenAnswer((_) async => const Success(''));

      final result = await notificationService.markAsRead(mock.entity.id);

      expect(result.exceptionOrNull(), isA<UnknowException>());
      verifyNever(localStorageService.write<String>(
        LocalStorageKey.notifications,
        any,
      ));
    });

    test('Return error if local storage method returns a type other than List',
        () async {
      when(localStorageService.read<String>(LocalStorageKey.notifications))
          .thenAnswer((_) async => const Success('{"key":"value"}'));

      final result = await notificationService.markAsRead(mock.entity.id);

      expect(result.exceptionOrNull(), isA<InvalidTypeException>());
      verifyNever(localStorageService.write<String>(
        LocalStorageKey.notifications,
        any,
      ));
    });

    test('Return error if notification list does not contain id', () async {
      when(localStorageService.read<String>(LocalStorageKey.notifications))
          .thenAnswer((_) async => Success(mock.jsonUnreadList));

      final result = await notificationService.markAsRead(Guid.random());

      expect(result.exceptionOrNull(), isA<NotFoundException>());
      verifyNever(localStorageService.write<String>(
        LocalStorageKey.notifications,
        any,
      ));
    });
  });

  group('markAsReadBatch', () {
    test('Success', () async {
      when(localStorageService.read<String>(LocalStorageKey.notifications))
          .thenAnswer((_) async => Success(mock.jsonUnreadList));

      when(localStorageService.write<String>(
              LocalStorageKey.notifications, any))
          .thenAnswer((_) async => const Success(true));

      final result =
          await notificationService.markAsReadBatch([mock.entity.id]);

      expect(result.getOrNull(), true);
      verify(localStorageService.write<String>(
        LocalStorageKey.notifications,
        any,
      )).called(1);
    });

    test('Return error if the local storage read method returns error',
        () async {
      when(localStorageService.read<String>(LocalStorageKey.notifications))
          .thenAnswer((_) async => const Failure(UnknowException()));

      final result =
          await notificationService.markAsReadBatch([mock.entity.id]);

      expect(result.exceptionOrNull(), isA<UnknowException>());
      verifyNever(localStorageService.write<String>(
        LocalStorageKey.notifications,
        any,
      ));
    });

    test('Return error if the local storage write method returns error',
        () async {
      when(localStorageService.read<String>(LocalStorageKey.notifications))
          .thenAnswer((_) async => Success(mock.jsonUnreadList));

      when(localStorageService.write<String>(
              LocalStorageKey.notifications, any))
          .thenAnswer((_) async => const Failure(UnknowException()));

      final result =
          await notificationService.markAsReadBatch([mock.entity.id]);

      expect(result.exceptionOrNull(), isA<UnknowException>());
      verify(localStorageService.write<String>(
        LocalStorageKey.notifications,
        any,
      )).called(1);
    });

    test('Return error if local storage method returns a type other than List',
        () async {
      when(localStorageService.read<String>(LocalStorageKey.notifications))
          .thenAnswer((_) async => const Success(''));

      final result =
          await notificationService.markAsReadBatch([mock.entity.id]);

      expect(result.exceptionOrNull(), isA<UnknowException>());
      verifyNever(localStorageService.write<String>(
        LocalStorageKey.notifications,
        any,
      ));
    });

    test('Return error if local storage method returns a type other than List',
        () async {
      when(localStorageService.read<String>(LocalStorageKey.notifications))
          .thenAnswer((_) async => const Success('{"key":"value"}'));

      final result =
          await notificationService.markAsReadBatch([mock.entity.id]);

      expect(result.exceptionOrNull(), isA<InvalidTypeException>());
      verifyNever(localStorageService.write<String>(
        LocalStorageKey.notifications,
        any,
      ));
    });

    test('Return error if notification list does not contain id', () async {
      when(localStorageService.read<String>(LocalStorageKey.notifications))
          .thenAnswer((_) async => Success(mock.jsonUnreadList));

      final result = await notificationService.markAsReadBatch([Guid.random()]);

      expect(result.exceptionOrNull(), isA<NotFoundException>());
      verifyNever(localStorageService.write<String>(
        LocalStorageKey.notifications,
        any,
      ));
    });
  });
}
