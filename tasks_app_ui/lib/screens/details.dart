import 'package:flutter/material.dart';
import 'package:tasks_app/utilities/calendar_view.dart';
import 'package:tasks_app/utilities/task_timeline.dart';
import 'package:tasks_app/utilities/tasks_list.dart';
/*
* Renders the detailed Timeline view of tasks through out the day when clicked on a particular course.
*
*/

class Details extends StatelessWidget {
  final Task task;
  const Details({required this.task, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> detailList = task.desc;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),

          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CalendarView(), // Creates a minimalistic calendar
                  timelineTitle(), // Displays constant text present above the timeline
                ],
              ),
            ),
          ),
          if (detailList.isEmpty)
            _noTasksToday()
          else
            _buildTimeline(detailList), // Builds the tasks timeline if there are tasks scheduled
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: 90,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back_ios),
        iconSize: 20,
      ),
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.more_vert, size: 30))
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("${task.title} tasks",
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("You have ${task.left} ${task.title} task(s) left today",
                style: TextStyle(fontSize: 11, color: Colors.grey[700]!)),
          ],
        ),
      ),
    );
  }
}

Container timelineTitle() {
  return Container(
    padding: const EdgeInsets.all(15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Tasks",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Text(
                "Timeline",
                style: TextStyle(
                    color: Colors.grey[700]!, fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.keyboard_arrow_down_outlined),
            ],
          ),
        )
      ],
    ),
  );
}

SliverList _buildTimeline(List detailList) {
  return SliverList(
      delegate: SliverChildBuilderDelegate(
          (_, i) => Timeline(taskDetails: detailList[i]),
          childCount: detailList.length));
}

SliverFillRemaining _noTasksToday() {
  return SliverFillRemaining(
    child: Container(
      color: Colors.white,
      child: const Center(
        child: Text(
          "No Tasks Today",
          style: TextStyle(color: Colors.grey, fontSize: 18),
        ),
      ),
    ),
  );
}
