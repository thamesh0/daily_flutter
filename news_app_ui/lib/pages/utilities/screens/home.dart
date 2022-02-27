import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141255),
      body:
      Column(
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: SafeArea(
                    child: Text(
                  "Latest News",
                  style: TextStyle(fontSize: 42, fontStyle: FontStyle.italic,color: Colors.white,
                  fontFamily: 'Circular'),
                )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
