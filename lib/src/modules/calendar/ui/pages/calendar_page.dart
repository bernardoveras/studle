import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../core/extensions/string_extension.dart';
import '../../../../core/helpers/date_helper.dart';
import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/ui/widgets/default_app_bar.dart';
import '../../../../core/ui/widgets/month_picker.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  static String get route => '/calendar';

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late final DateRangePickerController datePickerController;

  DateTime? selectedDate;
  int? viewMonth;
  DateTime? viewStartDate;

  void changeDate(DateTime? value) => setState(() {
        selectedDate = value;
      });

  void changeViewMonth(DateTime? startDate) {
    setState(() {
      viewMonth = startDate?.month;
      viewStartDate = startDate;
      datePickerController.displayDate = DateTime.now().copyWith(
        day: 1,
        month: startDate?.month,
      );
    });
  }

  @override
  void initState() {
    super.initState();

    datePickerController = DateRangePickerController();
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MonthPicker(
            month: viewMonth,
            changeMonth: (month) {
              changeViewMonth(DateTime.now().copyWith(day: 1, month: month));
            },
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
                child: Column(
                  children: [
                    Text(
                      viewStartDate == null
                          ? 'Selecione um mês'
                          : DateHelper.format(viewStartDate!,
                                  pattern: "MMMM 'de' yyyy")
                              .capitalize(),
                      style: Button1Typography(
                        fontWeight: FontWeight.w600,
                        color: MonoChromaticColors.gray.v900,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SfDateRangePicker(
                        controller: datePickerController,
                        onSelectionChanged: (args) => changeDate(args.value),
                        onViewChanged: (args) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            changeViewMonth(args.visibleDateRange.startDate);
                          });
                        },
                        headerHeight: 0,
                        monthViewSettings: DateRangePickerMonthViewSettings(
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
                        cellBuilder: (context, cellDetails) => Container(
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
                              //TODO: Alterar a lógica para os dias que tem atividade.
                              if (cellDetails.date.day.isEven)
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
                        ),
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
                    ),
                    const SizedBox(height: 16),
                    Divider(
                      height: 1.5,
                      thickness: 1.5,
                      color: MonoChromaticColors.gray.v200,
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Hoje',
                                style: Text2Typography(
                                  fontWeight: FontWeight.bold,
                                  color: MonoChromaticColors.gray.v900,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Badge(
                                  backgroundColor: MonoChromaticColors.gray,
                                  smallSize: 4,
                                ),
                              ),
                              Text(
                                '21 de setembro',
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
                              color: MonoChromaticColors.gray.v100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListView.separated(
                              itemCount: 2,
                              shrinkWrap: true,
                              separatorBuilder: (context, index) => Container(
                                height: 1.5,
                                width: double.infinity,
                                color: MonoChromaticColors.gray.v200,
                              ),
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Prof. Angela Maria',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Text3Typography(
                                        color: MonoChromaticColors.gray,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Pesquisa, Extensão e Inovação: Trabalho de Gradução',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Text3Typography(
                                        color: MonoChromaticColors.gray.v900,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text(
                                          '17:20 - 18:10',
                                          style: Text3Typography(
                                            color: MonoChromaticColors.gray,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          child: Badge(
                                            backgroundColor:
                                                MonoChromaticColors.gray,
                                            smallSize: 4,
                                          ),
                                        ),
                                        Text(
                                          'EAD',
                                          style: Text3Typography(
                                            color: MonoChromaticColors.gray,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
