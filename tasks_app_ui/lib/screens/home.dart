import 'package:flutter/material.dart';
import 'package:tasks_app/utilities/go_premium.dart';
import 'package:tasks_app/utilities/tasks_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoPremium(),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Tasks",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: TasksList()),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
      floatingActionButton: _buildAddButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: Row(
        children: [
          SizedBox(
            height: 45,
            width: 50,
            child: InkWell(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('Assets/avatar2.png', fit: BoxFit.fill),
              ),
            ),
          ),
          const SizedBox(width: 15),
          const Text(
            "Hi, Prathamesh!",
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          )
        ],
      ),
      actions: const [Icon(Icons.more_vert, color: Colors.black, size: 35)],
    );
  }
}

Widget _buildBottomNavBar() {
  return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ]),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          items: [
            BottomNavigationBarItem(
                label: 'Home',
                icon: GestureDetector(
                    child: const Icon(Icons.home_rounded, size: 30))),
            BottomNavigationBarItem(
                label: 'Account',
                icon: GestureDetector(
                    child: const Icon(Icons.person_rounded, size: 30))),
          ],
        ),
      ));
}

FloatingActionButton _buildAddButton() {
  return FloatingActionButton(
    onPressed: () {},
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    backgroundColor: Colors.black,
    child: const Icon(Icons.add, size: 35),
  );
}
