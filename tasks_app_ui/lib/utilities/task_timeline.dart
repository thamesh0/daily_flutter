import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Timeline extends StatelessWidget {
  final Map<String, dynamic> taskDetails;
  const Timeline({required this.taskDetails, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _drawLines(taskDetails['tlColor']),
          Expanded(child: Text(taskDetails['time'])),
          if (taskDetails['title'].isNotEmpty)
            _buildCard(taskDetails['bgColor'], taskDetails['title'],
                taskDetails['slot'])
          else
            _buildCard(Colors.white, '', '')
        ],
      ),
    );
  }
}

Widget _drawLines(Color lineclr) {
  return SizedBox(
    height: 80,
    width: 20,
    child: TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0,
      isFirst: true,
      indicatorStyle: IndicatorStyle(
        indicatorXY: 0,
        width: 15,
        indicator: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(width: 5, color: lineclr)),
        ),
      ),
      afterLineStyle: LineStyle(thickness: 2, color: lineclr),
    ),
  );
}

Widget _buildCard(Color bgclr, String title, String slot) {
  return Container(
    width: 250,
    padding: const EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          slot,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    ),
    decoration: BoxDecoration(
        color: bgclr,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10))),
  );
}
