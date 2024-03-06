import 'package:flutter/material.dart';

import '../../extensions/string_extension.dart';
import '../../helpers/date_helper.dart';
import '../design_system/design_system.dart';

class MonthPicker extends StatefulWidget {
  const MonthPicker({
    super.key,
    this.controller,
    this.month,
    this.changeMonth,
  });

  final ScrollController? controller;
  final int? month;
  final ValueChanged<int>? changeMonth;

  @override
  State<MonthPicker> createState() => _MonthPickerState();
}

class _MonthPickerState extends State<MonthPicker> {
  late final ScrollController controller;

  late int selectedMonth;

  void changeMonth(int month) {
    widget.changeMonth?.call(month);

    alignScrollToCenter(month);
  }

  void alignScrollToCenter(int month) {
    if (GlobalObjectKey(month).currentContext == null) return;

    Scrollable.ensureVisible(
      GlobalObjectKey(month).currentContext!,
      alignment: 0.5,
      duration: const Duration(milliseconds: 250),
      curve: Curves.ease,
    );
  }

  @override
  void didUpdateWidget(covariant MonthPicker oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.month != widget.month && widget.month != null) {
      selectedMonth = widget.month!;
      alignScrollToCenter(widget.month!);
    }
  }

  @override
  void initState() {
    super.initState();

    controller = widget.controller ?? ScrollController();
    selectedMonth = widget.month ?? DateTime.now().month;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      alignScrollToCenter(selectedMonth);
    });
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ListView.separated(
        controller: widget.controller,
        itemCount: 12,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final currentMonth = index + 1;
          final date = DateTime(2024, currentMonth);
          final isActive = selectedMonth == currentMonth;
          final isFirst = currentMonth == 1;
          final isLast = currentMonth == 12;

          return Padding(
            key: GlobalObjectKey(date.month),
            padding: isFirst
                ? const EdgeInsets.only(left: 16)
                : isLast
                    ? const EdgeInsets.only(right: 16)
                    : EdgeInsets.zero,
            child: GestureDetector(
              onTap: () => changeMonth(date.month),
              child: Chip(
                label: Text(
                  DateHelper.format(date, pattern: 'MMMM').capitalize(),
                  style: Button2Typography(
                    color: isActive ? PrimaryColors.brand : Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                elevation: 0,
                backgroundColor: isActive ? Colors.white : PrimaryColors.brand,
                shape: !isActive
                    ? const StadiumBorder(
                        side: BorderSide(
                          color: Colors.white,
                          width: 1.5,
                        ),
                      )
                    : null,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
