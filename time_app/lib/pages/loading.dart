import 'package:time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading";
  WorldTime instance =
      WorldTime(url: 'Asia/Kolkata', loc: 'Kolkata', flag: 'india.png');

  void setupTime() async {
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "location": instance.loc,
      "time": instance.time,
      "flag": instance.flag,
      "url": instance.url,
      "isDaytime": instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff0d47a1),
      body: Padding(
          padding: EdgeInsets.all(50.0),
          child: Center(
            child: SpinKitFadingCube(
              color: Colors.white,
              size: 45.0,
            ),
          )),
    );
  }
}
