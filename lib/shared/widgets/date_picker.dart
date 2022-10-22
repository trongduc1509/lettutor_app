import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import '../../base/define/style/default_style.dart';

class DatePickerView extends StatelessWidget {
  const DatePickerView(
      {Key? key,
      this.date,
      required this.active,
      required this.title,
      required this.onDateChosen,
      required this.isTo})
      : super(key: key);

  final DateTime? date;
  final bool active;
  final String title;
  final ValueChanged<DateTime> onDateChosen;
  final bool isTo;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () async {
          if (active) {
            var chosenDate = await showModalBottomSheet<DateTime>(
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                context: context,
                builder: (context) =>
                    buildSheetTime(context, time: date ?? DateTime.now()));
            if (chosenDate != null) {
              if (isTo) {
                chosenDate = chosenDate
                    .add(const Duration(hours: 23, minutes: 59, seconds: 59));
              }
              onDateChosen(chosenDate);
            }
          }
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: DefaultStyle().greyDisable)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: DefaultStyle()
                            .t12Medium
                            .apply(color: DefaultStyle().greySecondary),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        date != null
                            ? convertDateFrom(date!, "dd/MM/yyyy")
                            : 'Select a day',
                        style: DefaultStyle()
                            .t16Medium
                            .apply(color: DefaultStyle().blackTitle),
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  semanticLabel: "arrow_down",
                  size: 15,
                  color: Colors.black.withOpacity(0.45),
                )
              ],
            ),
          ),
        ),
      );
}

Widget buildSheetTime(BuildContext context, {required DateTime time}) {
  time = DateTime(time.year, time.month, time.day, time.hour);
  var chosenTime = DateTime(time.year, time.month, time.day, time.hour);
  return StatefulBuilder(
    builder: ((context, setState) => Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 50,
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.close,
                                semanticLabel: "close",
                                size: 16,
                                color: Colors.black))),
                    Center(
                        child: Text("Chọn ngày", style: DefaultStyle().t16Bold))
                  ],
                ),
              ),
              const Divider(
                height: 1,
              ),
              Expanded(
                child: CupertinoApp(
                  theme: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: DefaultStyle()
                          .t16Medium
                          .apply(color: Colors.black, fontSizeDelta: 2.5),
                    ),
                  ),
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('vi', ''),
                    Locale('vn', ''), // arabic, no country code
                  ],
                  builder: (context, widget) => CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: chosenTime,
                    onDateTimeChanged: (DateTime newDateTime) {
                      setState(() {
                        chosenTime = newDateTime;
                      });
                    },
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  child: const Text("Xác nhận"),
                  onPressed: () {
                    Navigator.of(context).pop(chosenTime);
                  },
                ),
              )
            ],
          ),
        )),
  );
}

String convertDateFrom(DateTime from, String format) {
  final docDateTime = DateTime.parse(from.toString());
  var dateFormated = DateFormat(format).format(docDateTime);
  print('===== format Date $dateFormated');
  return dateFormated;
}
