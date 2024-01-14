import 'package:flutter/material.dart';
import 'package:tasks_app/screens/details.dart';
import 'package:dotted_border/dotted_border.dart';
import 'constants.dart';

class TasksList extends StatelessWidget {
  TasksList({Key? key}) : super(key: key);

  final List<Task> taskslist = Task.generateTasks();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
          itemCount: taskslist.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (context, i) => taskslist[i].islast!
              ? _buildAddTask(context)
              : _buildTask(context, taskslist[i])),
    );
  }
}

Widget _buildTask(BuildContext context, Task task) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Details(task: task)));
    },
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: task.bgclr, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(task.iconData, color: task.iconclr, size: 35),
          const SizedBox(height: 30),
          Text(
            task.title!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
              child: Row(
            children: [
              _buildTaskStatus(task.btnclr, task.iconclr, '${task.left} left'),
              const SizedBox(width: 10),
              _buildTaskStatus(Colors.white, task.iconclr, '${task.done} Done'),
            ],
          ))
        ],
      ),
    ),
  );
}

Widget _buildTaskStatus(Color? bgclr, Color? txtclr, String txt) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(20), color: bgclr),
    child: Text(txt, style: TextStyle(color: txtclr)),
  );
}

Widget _buildAddTask(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.pushNamed(context, '/create_task'),
    child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(20),
        dashPattern: const [10, 5],
        color: Colors.grey,
        strokeWidth: 1,
        child: const Center(
          child: Text(
            "+ Add",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        )),
  );
}

class Task {
  IconData? iconData;
  String? title;
  Color? bgclr;
  Color? iconclr;
  Color? btnclr;
  bool? islast;
  num? left;
  num? done;
  List<Map<String, dynamic>> desc;
  Task(
      {this.iconData,
        this.title,
        this.bgclr,
        this.iconclr,
        this.btnclr,
        this.left,
        this.done,
        this.islast = false,
        required this.desc});

  static List<Task> generateTasks() {
    return [
      Task(
          iconData: Icons.person_rounded,
          title: 'Personal',
          bgclr: kRedLight,
          iconclr: kRedDark,
          btnclr: kRed,
          left: 0,
          done: 1,
          desc: [
          ]),
      Task(
        iconData: Icons.cases_rounded,
        title: 'Work',
        bgclr: kYellowLight,
        iconclr: kYellowDark,
        btnclr: kYellow,
        left: 6,
        done: 0,
        desc: [
          {
            'title': 'DSA class',
            'time': '9:00 am',
            'slot': '9:00 am - 10:00 am',
            'tlColor': kRedDark,
            'bgColor': kRedLight,
          },
          {
            'title': 'OS class',
            'time': '10:00 am',
            'slot': '10:00 am - 11:00 am',
            'tlColor': kYellowDark,
            'bgColor': kYellowLight,
          },
          {
            'title': 'TTVC class',
            'time': '11:00 am',
            'slot': '11:00 am - 12:00 am',
            'tlColor': kRedDark,
            'bgColor': kRedLight,
          },
          {
            'title': '',
            'time': '12:00 pm',
            'slot': '12:00 pm - 1:00 pm',
            'tlColor': Colors.grey.withOpacity(0.3),
          },
          {
            'title': '',
            'time': '1:00 pm',
            'slot': '1:00 pm - 5:00 pm',
            'tlColor': kBlueDark,
            'bgColor': kBlueLight,
          },
          {
            'title': 'MA lab',
            'time': '',
            'slot': '2:00 pm - 3:00 pm',
            'tlColor': kBlueDark,
            'bgColor': kBlueLight,
          },
          {
            'title': '',
            'time': '4:00 pm',
            'slot': '3:00 pm - 4:00 pm',
            'tlColor': kBlueDark,
            'bgColor': kBlueLight,
          },
          {
            'title': '',
            'time': '5:00 pm',
            'slot': '5:00 pm - 11:00 pm',
            'tlColor': Colors.grey.withOpacity(0.3),
          },
          {
            'title': '',
            'time': '11:00 pm',
            'slot': '5:00 pm - 11:00 pm',
            'tlColor': Colors.grey.withOpacity(0.3),
          },
          {
            'title': 'Lab Assignment 6',
            'time': '12:00 am',
            'slot': '11:00 pm - 12:00 am',
            'tlColor': kRedDark,
            'bgColor': kRedLight,
          },
          {
            'title': 'Lab Assignment 7',
            'time': '12:00 am',
            'slot': '11:00 pm - 12:00 am',
            'tlColor': kBlueDark,
            'bgColor': kBlueLight,
          },
        ],
      ),
      Task(
        iconData: Icons.favorite_rounded,
        title: 'Health',
        bgclr: kBlueLight,
        iconclr: kBlueDark,
        btnclr: kBlue,
        left: 0,
        done: 2,
        desc: [],
      ),
      Task(islast: true, desc: []),
    ];
  }
}
