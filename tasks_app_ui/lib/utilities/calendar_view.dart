import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
* Creating date and week list, using list builder.
* Using container and ternary conditions to create appropriate highlight around the data/day -> chkSelected function
*
* chkSelected() ->  highlights the current date with light grey box, rest dates are kept white.
*
*/

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  CalendarViewState createState() => CalendarViewState();
}

class CalendarViewState extends State<CalendarView> {
  final weeklist = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final datelist = ['7', '8', '9', '10', '11', '12', '13'];
  int selected = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: weeklist.length,
        separatorBuilder: (_, i) => const SizedBox(width: 5),
        itemBuilder: (_, i) => _buildDateView(i),
      ),
    );
  }

  Widget _buildDateView(int i) {
    return GestureDetector(
        onTap: () => setState(() => selected = i),
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 3.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: chkSelected(
                Colors.grey.withOpacity(0.1), Colors.transparent, i),
          ),

          // Day is on top and Date in below it.
          // TODO: make the Date list scrollable and put a drop down list for selecting months and years
          child: Column(
            children: [
              Text(
                weeklist[i],
                style: TextStyle(
                  color: chkSelected(Colors.black, Colors.grey, i),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                datelist[i],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: chkSelected(Colors.black, Colors.grey, i),
                ),
              ),
            ],
          ),
        ));
  }

  Color chkSelected(Color tColor, Color fColor, int i) {
    return selected == i ? tColor : fColor;
  }
}
