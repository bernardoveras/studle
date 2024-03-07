import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../core/extensions/date_time_extension.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../core/helpers/date_helper.dart';
import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/ui/design_system/widgets/skeletons/skeleton_container.dart';
import '../../../../core/ui/widgets/default_app_bar.dart';
import '../../../../core/ui/widgets/month_picker.dart';
import '../../../../core/utils/debouncer.dart';
import '../../domain/entities/calendar_activity_entity.dart';
import '../../domain/entities/calendar_day_off_entity.dart';
import '../cubits/calendar_cubit.dart';
import '../cubits/calendar_state.dart';
import '../widgets/calendar_activity_card.dart';
import '../widgets/calendar_day_off_card.dart';
import '../widgets/calendar_picker.dart';
import '../widgets/calendar_skeleton_card.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  static String get route => '/calendar';

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late final CalendarCubit cubit;
  late final DateRangePickerController datePickerController;
  late final ScrollController scrollController;

  final fetchDebouncer = Debouncer(milliseconds: 200);

  DateTime? selectedDate;
  int? viewMonth;
  DateTime? viewStartDate;

  Future<void> changeDate(DateTime? value) async {
    setState(() {
      selectedDate = value;
    });

    await scrollToUp();

    fetchDebouncer.run(() {
      cubit.fetch(startDate: value);
    });
  }

  Future<void> changeViewMonth(DateTime? startDate) async {
    setState(() {
      viewMonth = startDate?.month;
      viewStartDate = startDate;
      datePickerController.selectedDate = null;
      datePickerController.displayDate = DateTime.now().copyWith(
        day: 1,
        month: startDate?.month,
      );
    });

    await scrollToUp();

    fetchDebouncer.run(() {
      cubit.fetch(startDate: startDate);
    });
  }

  Future<void> scrollToUp() async {
    if (scrollController.offset == 0) return;

    await scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
    await Future.delayed(const Duration(milliseconds: 50));
  }

  @override
  void initState() {
    super.initState();

    datePickerController = DateRangePickerController();
    scrollController = ScrollController();

    cubit = context.read()..fetch();
  }

  @override
  void dispose() {
    super.dispose();

    datePickerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bottomPadding = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Calendário',
        backgroundColor: PrimaryColors.brand,
        foregroundColor: Colors.white,
        shape: LinearBorder.none,
      ),
      backgroundColor: PrimaryColors.brand,
      body: BlocBuilder<CalendarCubit, CalendarState>(
          bloc: cubit,
          builder: (context, state) {
            final isLoading = state is LoadingState;
            final busyDates =
                state is SuccessState ? state.busyDates : <DateTime>[];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IgnorePointer(
                  ignoring: isLoading,
                  child: AnimatedOpacity(
                    opacity: isLoading ? 0.5 : 1,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    child: MonthPicker(
                      month: viewMonth,
                      changeMonth: (month) {
                        changeViewMonth(
                          DateTime.now().copyWith(day: 1, month: month),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      color: MonoChromaticColors.backgroundColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                        top: 16,
                        bottom: 16 + bottomPadding,
                      ),
                      controller: scrollController,
                      child: Column(
                        children: [
                          IgnorePointer(
                            ignoring: isLoading,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: AnimatedOpacity(
                                opacity: isLoading ? 0.5 : 1,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                                child: CalendarPicker(
                                  controller: datePickerController,
                                  selectedDate: selectedDate,
                                  viewStartDate: viewStartDate,
                                  changeDate: changeDate,
                                  changeViewMonth: changeViewMonth,
                                  busyDates: busyDates,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Divider(
                            height: 1.5,
                            thickness: 1.5,
                            color: MonoChromaticColors.gray.v200,
                          ),
                          const SizedBox(height: 16),
                          switch (state) {
                            SuccessState _ => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: state.data.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 24),
                                  itemBuilder: (context, index) {
                                    final date =
                                        state.data.keys.elementAt(index);
                                    final isToday = date.isToday();

                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              isToday
                                                  ? 'Hoje'
                                                  : DateHelper.format(
                                                      date,
                                                      pattern: 'EEEE',
                                                    ).capitalize(),
                                              style: Text2Typography(
                                                fontWeight: FontWeight.bold,
                                                color: MonoChromaticColors
                                                    .gray.v900,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8,
                                              ),
                                              child: Badge(
                                                backgroundColor:
                                                    MonoChromaticColors.gray,
                                                smallSize: 4,
                                              ),
                                            ),
                                            Text(
                                              DateHelper.format(
                                                date,
                                                pattern: "dd 'de' MMMM",
                                              ),
                                              style: Text2Typography(
                                                fontWeight: FontWeight.w500,
                                                color: MonoChromaticColors.gray,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        Container(
                                          decoration: BoxDecoration(
                                            color:
                                                MonoChromaticColors.gray.v100,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: ListView.separated(
                                            itemCount: state.data[date]!.length,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            separatorBuilder: (context, index) {
                                              return Container(
                                                height: 1.5,
                                                width: double.infinity,
                                                color: MonoChromaticColors
                                                    .gray.v200,
                                              );
                                            },
                                            padding: EdgeInsets.zero,
                                            itemBuilder: (context, index) {
                                              final item =
                                                  state.data[date]![index];

                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: switch (item) {
                                                  CalendarDayOffEntity dayOff =>
                                                    CalendarDayOffCard(
                                                      dayOff: dayOff,
                                                    ),
                                                  CalendarActivityEntity
                                                    activity =>
                                                    CalendarActivityCard(
                                                      activity: activity,
                                                    ),
                                                  _ => const SizedBox.shrink(),
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            LoadingState _ => Animate(
                                effects: const [
                                  FadeEffect(
                                    curve: Curves.easeInOut,
                                    duration: Duration(milliseconds: 400),
                                  ),
                                ],
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: 2,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 24),
                                    itemBuilder: (context, index) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SkeletonContainer(
                                                height: 18,
                                                width: 100,
                                                baseColor: MonoChromaticColors
                                                    .gray.v200,
                                                highlightColor:
                                                    MonoChromaticColors
                                                        .gray.v300,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                ),
                                                child: SkeletonContainer(
                                                  height: 4,
                                                  width: 4,
                                                  shape: BoxShape.circle,
                                                  baseColor: MonoChromaticColors
                                                      .gray.v200,
                                                  highlightColor:
                                                      MonoChromaticColors
                                                          .gray.v300,
                                                ),
                                              ),
                                              SkeletonContainer(
                                                height: 18,
                                                width: 100,
                                                baseColor: MonoChromaticColors
                                                    .gray.v200,
                                                highlightColor:
                                                    MonoChromaticColors
                                                        .gray.v300,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 16),
                                          Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  MonoChromaticColors.gray.v100,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: ListView.separated(
                                              itemCount: index == 0 ? 2 : 1,
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              separatorBuilder:
                                                  (context, index) {
                                                return Container(
                                                  height: 1.5,
                                                  width: double.infinity,
                                                  color: MonoChromaticColors
                                                      .gray.v200,
                                                );
                                              },
                                              padding: EdgeInsets.zero,
                                              itemBuilder: (context, index) {
                                                return const Padding(
                                                  padding: EdgeInsets.all(16),
                                                  child: CalendarSkeletonCard(),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            _ => const SizedBox.shrink(),
                          }
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
