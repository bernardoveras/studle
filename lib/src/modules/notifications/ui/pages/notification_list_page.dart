import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/image_source_constants.dart';
import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/ui/widgets/default_app_bar.dart';
import '../../../../core/ui/widgets/states/states.dart';
import '../../domain/entities/notification_entity.dart';
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
          final unreadData =
              state is SuccessState ? state.unreadData : <NotificationEntity>[];

          return Scaffold(
            appBar: const DefaultAppBar(
              title: 'Notificações',
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
                              child: const EmptyStateDisplay(
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
                                onRefresh: () => cubit.fetch(refreshing: true),
                                child: NotificationList(
                                  data: allData,
                                  markAsRead: cubit.markAsRead,
                                ),
                              ),
                              RefreshIndicator(
                                key: const ValueKey('notifications.unread'),
                                onRefresh: () => cubit.fetch(refreshing: true),
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
        },
      ),
    );
  }
}
