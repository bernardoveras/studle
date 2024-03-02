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
      child: Scaffold(
        appBar: const DefaultAppBar(
          title: 'Notificações',
        ),
        body: BlocBuilder<NotificationListCubit, NotificationListState>(
          bloc: cubit,
          builder: (context, state) {
            final isError = state is ErrorState;
            final isSuccess = state is SuccessState;
            final allData =
                state is SuccessState ? state.allData : <NotificationEntity>[];
            final unreadData = state is SuccessState
                ? state.unreadData
                : <NotificationEntity>[];

            return Column(
              children: [
                if (!isError)
                  NotificationTabBar(
                    onChanged: onChangeTab,
                    unreadCount: unreadData.length,
                    disabled: !isSuccess,
                  ),
                Expanded(
                  child: switch (state) {
                    InitialState _ => const SizedBox(),
                    ErrorState _ => SingleChildScrollView(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 48,
                          bottom: 20 + MediaQuery.paddingOf(context).bottom,
                        ),
                        child: ErrorStateDisplay(
                          description: state.error.message,
                          primaryButtonText: 'Recarregar',
                          onPressedPrimaryButton: () => cubit.fetch(),
                          secondaryButtonText: 'Falar com o suporte',
                          onPressedSecondaryButton: () {},
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
                        ? SingleChildScrollView(
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 48,
                              bottom: 20 + MediaQuery.paddingOf(context).bottom,
                            ),
                            child: EmptyStateDisplay(
                              imageSource: ImageSourceConstants
                                  .notificationsIllustration,
                              description:
                                  'Não encontramos notificações no momento.',
                            ),
                          )
                        : PageView(
                            controller: pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              RefreshIndicator(
                                key: const ValueKey('notifications.all'),
                                onRefresh: () => cubit.fetch(refreshing: true),
                                child: NotificationList(data: allData),
                              ),
                              RefreshIndicator(
                                key: const ValueKey('notifications.unread'),
                                onRefresh: () => cubit.fetch(refreshing: true),
                                child: NotificationList(data: unreadData),
                              ),
                            ],
                          ),
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
