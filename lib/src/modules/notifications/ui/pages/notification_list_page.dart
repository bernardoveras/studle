import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/image_source_constants.dart';
import '../../../../core/extensions/build_context_extension.dart';
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
                NotificationTabBar(
                  onChanged: onChangeTab,
                  unreadCount: unreadData.length,
                  disabled: allData.isEmpty,
                ),
                Expanded(
                  child: switch (state) {
                    InitialState _ => const SizedBox(),
                    ErrorState _ => Center(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: DefaultAppBar.defaultHeight +
                                context.bottomPadding,
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
                          bottom: 16 + context.bottomPadding,
                        ),
                        separatorBuilder: (_, __) => Container(
                          height: 1.5,
                          color: MonoChromaticColors.divider,
                          margin: const EdgeInsets.only(bottom: 24),
                        ),
                        itemBuilder: (_, __) =>
                            const NotificationSkeletonCard(),
                      ),
                    _ => PageView(
                        controller: pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          RefreshIndicator(
                            key: const ValueKey('notifications.all'),
                            onRefresh: () => cubit.fetch(refreshing: true),
                            child: allData.isEmpty
                                ? Center(
                                    child: SingleChildScrollView(
                                      padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: DefaultAppBar.defaultHeight +
                                            context.bottomPadding,
                                      ),
                                      child: const EmptyStateDisplay(
                                        imageSource: ImageSourceConstants
                                            .notificationsIllustration,
                                        description:
                                            'Não encontramos notificações no momento.',
                                      ),
                                    ),
                                  )
                                : NotificationList(
                                    data: allData,
                                    markAsRead: cubit.markAsRead,
                                  ),
                          ),
                          RefreshIndicator(
                            key: const ValueKey('notifications.unread'),
                            onRefresh: () => cubit.fetch(refreshing: true),
                            child: unreadData.isEmpty
                                ? Center(
                                    child: SingleChildScrollView(
                                      padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: DefaultAppBar.defaultHeight +
                                            context.bottomPadding,
                                      ),
                                      child: const EmptyStateDisplay(
                                        imageSource: ImageSourceConstants
                                            .notificationsIllustration,
                                        description:
                                            'Não encontramos notificações não lidas no momento.',
                                      ),
                                    ),
                                  )
                                : NotificationList(
                                    data: unreadData,
                                    markAsRead: cubit.markAsRead,
                                    animate: false,
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
