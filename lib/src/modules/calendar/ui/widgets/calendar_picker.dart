import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../core/extensions/string_extension.dart';
import '../../../../core/helpers/date_helper.dart';
import '../../../../core/ui/design_system/design_system.dart';

class CalendarPicker extends StatefulWidget {
  const CalendarPicker({
    super.key,
    this.changeViewMonth,
    this.changeDate,
    this.controller,
    this.selectedDate,
    this.viewStartDate,
    this.busyDates,
  });

  final ValueChanged<DateTime?>? changeViewMonth;
  final ValueChanged<DateTime?>? changeDate;
  final DateRangePickerController? controller;
  final DateTime? selectedDate;
  final DateTime? viewStartDate;
  final List<DateTime>? busyDates;

  @override
  State<CalendarPicker> createState() => _CalendarPickerState();
}

class _CalendarPickerState extends State<CalendarPicker> {
  late final DateRangePickerController datePickerController;

  late DateTime? selectedDate;
  late DateTime? viewStartDate;

  @override
  void didUpdateWidget(covariant CalendarPicker oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.selectedDate != widget.selectedDate) {
      selectedDate = widget.selectedDate;
    }

    if (oldWidget.viewStartDate != widget.viewStartDate) {
      viewStartDate = widget.viewStartDate;
    }
  }

  bool isBusy(DateTime date) {
    return widget.busyDates?.contains(date) == true;
  }

  @override
  void initState() {
    super.initState();

    datePickerController = widget.controller ?? DateRangePickerController();
    selectedDate = widget.selectedDate;
    viewStartDate = widget.viewStartDate;
  }

  @override
  void dispose() {
    super.dispose();

    datePickerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          viewStartDate == null
              ? 'Selecione um mês'
              : DateHelper.format(viewStartDate!, pattern: "MMMM 'de' yyyy")
                  .capitalize(),
          textAlign: TextAlign.center,
          style: Button1Typography(
            fontWeight: FontWeight.w600,
            color: MonoChromaticColors.gray.v900,
          ),
        ),
        const SizedBox(height: 16),
        SfDateRangePicker(
          controller: datePickerController,
          onSelectionChanged: (args) => widget.changeDate?.call(args.value),
          initialDisplayDate: viewStartDate ?? DateTime.now(),
          onViewChanged: (args) {
            Future.delayed(Duration.zero).then(
              (value) =>
                  widget.changeViewMonth?.call(args.visibleDateRange.startDate),
            );
          },
          toggleDaySelection: true,
          showActionButtons: false,
          showTodayButton: false,
          showNavigationArrow: false,
          headerHeight: 0,
          initialSelectedDate: selectedDate,
          monthViewSettings: DateRangePickerMonthViewSettings(
            specialDates: widget.busyDates,
            viewHeaderStyle: DateRangePickerViewHeaderStyle(
              textStyle: Button1Typography(
                color: MonoChromaticColors.gray.v400,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          selectionTextStyle: const Button1Typography(
            color: Colors.white,
          ),
          selectionColor: Colors.transparent,
          cellBuilder: (context, cellDetails) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: cellDetails.date == selectedDate
                    ? PrimaryColors.brand
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  if (isBusy(cellDetails.date))
                    Positioned(
                      top: -4,
                      right: -8,
                      child: Badge(
                        backgroundColor: SemanticColors.negative,
                      ),
                    ),
                  Text(
                    cellDetails.date.day.toString(),
                    style: Button1Typography(
                      color: cellDetails.date == selectedDate
                          ? Colors.white
                          : MonoChromaticColors.gray.v600,
                    ),
                  ),
                ],
              ),
            );
          },
          monthCellStyle: DateRangePickerMonthCellStyle(
            todayTextStyle: Button1Typography(
              color: MonoChromaticColors.gray.v400,
              fontWeight: FontWeight.w500,
            ),
            textStyle: Button1Typography(
              color: MonoChromaticColors.gray.v600,
            ),
          ),
        ),
      ],
    );
  }
}
