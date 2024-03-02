import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/enums/notification_status_enum.dart';
import 'notification_list_state.dart';

class NotificationListCubit extends Cubit<NotificationListState> {
  NotificationListCubit() : super(const InitialState());

  Future<void> fetch() async {
    try {
      emit(const LoadingState());

      await Future.delayed(const Duration(seconds: 1));

      final allNotifications = [
        NotificationEntity(
          id: 2,
          title: 'Open Design 2024',
          description:
              'Não fique de fora do Open! Garante sua inscrição no maior evento de design da região!',
          status: NotificationStatus.read,
          createdAt: DateTime(2024, 2, 16, 15, 20),
        ),
        NotificationEntity(
          id: 1,
          title: '6º Encontro de Clássicos na My School',
          description:
              'Já estamos em fevereiro e o evento mais aguardado pelos amantes de carro chegou!',
          status: NotificationStatus.read,
          createdAt: DateTime(2024, 2, 14, 12, 50),
        ),
        NotificationEntity(
          id: 4,
          title: 'Nova matéria',
          description: 'Foi cadastrada uma nova matéria no seu registro! 🥳📚',
          status: NotificationStatus.unread,
          createdAt: DateTime(2024, 3, 1, 12, 50),
        ),
        NotificationEntity(
          id: 3,
          title: 'Reitoria',
          description:
              'Participe da campanha do Vestibular 2024! A seleção está acontecendo hoje (30/08), das 20h às 23h',
          status: NotificationStatus.unread,
          createdAt: DateTime(2024, 3, 1, 12, 30),
        ),
      ];

      final unreadNotifications = allNotifications
          .where((x) => x.status == NotificationStatus.unread)
          .toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

      emit(SuccessState(
        allData: allNotifications,
        unreadData: unreadNotifications,
      ));
    } on GenericException catch (e) {
      emit(ErrorState(e));
    } catch (e) {
      emit(ErrorState(UnknowException(error: e)));
    }
  }
}
