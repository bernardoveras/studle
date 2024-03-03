import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/constants/image_source_constants.dart';
import '../../../../core/constants/local_storage_key.dart';
import '../../../../core/dependecy_injection/injector.dart';
import '../../../../core/services/local_storage/domain/services/i_local_storage_service.dart';
import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/ui/widgets/default_app_bar.dart';
import '../../../../core/ui/widgets/states/states.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/enums/notification_link_type_enum.dart';
import '../../domain/enums/notification_status_enum.dart';
import '../cubits/notification_list_cubit.dart';
import '../cubits/notification_list_state.dart';
import '../widgets/lists/notification_list.dart';
import '../widgets/notification_skeleton_card.dart';
import '../widgets/notification_tab_bar.dart';

class NotificationListPage extends StatefulWidget {
  const NotificationListPage({super.key});

  static String get route => '/notifications';

  @override
  State<NotificationListPage> createState() => _NotificationListPageState();
}

class _NotificationListPageState extends State<NotificationListPage> {
  late final NotificationListCubit cubit;

  late final PageController pageController;

  void onChangeTab(int value) => pageController.animateToPage(
        value,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 250),
      );

  @override
  void initState() {
    super.initState();

    cubit = context.read()..fetch();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      key: widget.key,
      length: 2,
      child: BlocBuilder<NotificationListCubit, NotificationListState>(
          bloc: cubit,
          builder: (context, state) {
            final isLoading = state is LoadingState;
            final isSuccess = state is SuccessState;
            final allData =
                state is SuccessState ? state.allData : <NotificationEntity>[];
            final unreadData = state is SuccessState
                ? state.unreadData
                : <NotificationEntity>[];

            return Scaffold(
              appBar: const DefaultAppBar(
                title: 'Notificações',
              ),
              floatingActionButton: isLoading
                  ? null
                  : allData.isEmpty
                      ? FloatingActionButton(
                          tooltip: 'Include test data',
                          onPressed: () {
                            final localStorageService =
                                Injector.resolve<ILocalStorageService>();

                            localStorageService.write(
                                LocalStorageKey.notifications,
                                jsonEncode([
                                  NotificationEntity(
                                    id: 2,
                                    title: 'Open Design 2024',
                                    description:
                                        'Não fique de fora do Open! Garante sua inscrição no maior evento de design da região!',
                                    status: NotificationStatus.unread,
                                    createdAt: DateTime(2024, 2, 16, 15, 20),
                                  ),
                                  NotificationEntity(
                                    id: 1,
                                    title:
                                        '6º Encontro de Clássicos na My School',
                                    description:
                                        'Já estamos em fevereiro e o evento mais aguardado pelos amantes de carro chegou!',
                                    status: NotificationStatus.unread,
                                    createdAt: DateTime(2024, 2, 14, 12, 50),
                                    link: 'https://google.com',
                                    linkType:
                                        NotificationLinkType.redirectToSite,
                                  ),
                                  NotificationEntity(
                                    id: 4,
                                    title: 'Nova matéria',
                                    description:
                                        'Foi cadastrada uma nova matéria no seu registro! 🥳📚',
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
                                ].map((e) => e.toMap()).toList()));

                            cubit.fetch();
                          },
                          child: const Icon(PhosphorIconsRegular.bug),
                        )
                      : FloatingActionButton(
                          tooltip: 'Remove all data',
                          onPressed: () {
                            final localStorageService =
                                Injector.resolve<ILocalStorageService>();

                            localStorageService
                                .delete(LocalStorageKey.notifications);

                            cubit.fetch();
                          },
                          child: const Icon(PhosphorIconsRegular.trashSimple),
                        ),
              body: Column(
                children: [
                  if ((isSuccess && allData.isNotEmpty) || isLoading)
                    NotificationTabBar(
                      onChanged: onChangeTab,
                      unreadCount: unreadData.length,
                      disabled: !isSuccess,
                    ),
                  Expanded(
                    child: switch (state) {
                      InitialState _ => const SizedBox(),
                      ErrorState _ => Center(
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: MediaQuery.paddingOf(context).bottom +
                                  DefaultAppBar.defaultHeight,
                            ),
                            child: ErrorStateDisplay(
                              description: state.error.message,
                              primaryButtonText: 'Recarregar',
                              onPressedPrimaryButton: () => cubit.fetch(),
                              secondaryButtonText: 'Falar com o suporte',
                              onPressedSecondaryButton: () {},
                            ),
                          ),
                        ),
                      LoadingState _ => ListView.separated(
                          itemCount: 5,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16,
                            bottom: 16 + MediaQuery.paddingOf(context).bottom,
                          ),
                          separatorBuilder: (_, __) => Container(
                            height: 1.5,
                            color: MonoChromaticColors.divider,
                            margin: const EdgeInsets.only(bottom: 24),
                          ),
                          itemBuilder: (_, __) =>
                              const NotificationSkeletonCard(),
                        ),
                      _ => allData.isEmpty
                          ? Center(
                              child: SingleChildScrollView(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  bottom: MediaQuery.paddingOf(context).bottom +
                                      DefaultAppBar.defaultHeight,
                                ),
                                child: EmptyStateDisplay(
                                  imageSource: ImageSourceConstants
                                      .notificationsIllustration,
                                  description:
                                      'Não encontramos notificações no momento.',
                                ),
                              ),
                            )
                          : PageView(
                              controller: pageController,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                RefreshIndicator(
                                  key: const ValueKey('notifications.all'),
                                  onRefresh: () =>
                                      cubit.fetch(refreshing: true),
                                  child: NotificationList(
                                    data: allData,
                                    markAsRead: cubit.markAsRead,
                                  ),
                                ),
                                RefreshIndicator(
                                  key: const ValueKey('notifications.unread'),
                                  onRefresh: () =>
                                      cubit.fetch(refreshing: true),
                                  child: NotificationList(
                                    data: unreadData,
                                    markAsRead: cubit.markAsRead,
                                  ),
                                ),
                              ],
                            ),
                    },
                  )
                ],
              ),
            );
          }),
    );
  }
}
