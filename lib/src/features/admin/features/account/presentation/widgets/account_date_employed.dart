import 'package:flutter/material.dart';

class DateEmployed {
  String day = '1';
  String month = 'April';
  String year = '2000';
  DateTime get toDateTime {
    return DateTime.utc(
        int.parse(year), monthsList.indexOf(month) + 1, int.parse(day));
  }

  static List<String> get monthsList => [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December'
      ];
}

class DateDropdowns extends StatefulWidget {
  const DateDropdowns({super.key, required this.dateEmployed});
  final DateEmployed dateEmployed;
  @override
  State<DateDropdowns> createState() => _DateDropdownsState();
}

class _DateDropdownsState extends State<DateDropdowns> {
  String? _selectedDay;
  String? _selectedMonth;
  String? _selectedYear;

  final List<String> _daysList =
      List.generate(31, (index) => (index + 1).toString());

  final List<String> _yearsList =
      List.generate(100, (index) => (index + 1920).toString());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              "Date Employed:",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontSize: 10),
            ),
          ),
          Container(
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedDay,
                onChanged: (String? newValue) {
                  setState(() {
                    widget.dateEmployed.day = newValue!;
                    _selectedDay = newValue;
                  });
                },
                hint: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    'Day',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                items: _daysList
                    .map((day) => DropdownMenuItem<String>(
                          value: day,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(
                              day,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedMonth,
                onChanged: (String? newValue) {
                  setState(() {
                    widget.dateEmployed.month = newValue!;

                    _selectedMonth = newValue;
                  });
                },
                hint: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    'Month',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                items: DateEmployed.monthsList
                    .map((month) => DropdownMenuItem<String>(
                          value: month,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(
                              month,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedYear,
                onChanged: (String? newValue) {
                  setState(() {
                    widget.dateEmployed.year = newValue!;
                    _selectedYear = newValue;
                  });
                },
                hint: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text('Year',
                      style: Theme.of(context).textTheme.bodySmall),
                ),
                items: _yearsList
                    .map((year) => DropdownMenuItem<String>(
                          value: year,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(
                              year,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
