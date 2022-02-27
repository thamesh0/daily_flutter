import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty
        ? (ModalRoute.of(context)!.settings.arguments as Map)
        : data;

    String bgimg = data["isDaytime"] ? "day.png" : "night.png";
    Color? barColor = data["isDaytime"] ? Colors.blue : Colors.indigo[800];
    Color? txt = Colors.grey[300];
    Color? bigTxt = Colors.white;
    return Scaffold(
      backgroundColor: barColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/$bgimg"), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: <Widget>[
              TextButton.icon(
                onPressed: () async {
                  dynamic res = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      "location": res["location"],
                      "time": res["time"],
                      "flag": res["flag"],
                      "url": res["url"],
                      "isDaytime": res["isDaytime"],
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: txt,
                ),
                label: Text(
                  "Edit Location   ",
                  style: TextStyle(color: txt, fontSize: 18.0),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data["location"],
                    style: TextStyle(
                      color: bigTxt,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                data["time"],
                style: TextStyle(
                  color: bigTxt,
                  fontSize: 66.0,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
