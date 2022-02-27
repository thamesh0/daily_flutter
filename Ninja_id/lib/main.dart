import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: NinjaId(),
    ));

class NinjaId extends StatelessWidget {
  const NinjaId({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        elevation: 0.0,
        title: const Text(
          "Ninja Card",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               const Center(
                 child: CircleAvatar(
                   radius: 60.0,
                  backgroundImage: AssetImage("assets/ninja.jpg"),
              ),
               ),
              const Divider(
                thickness: 2.0,
                height: 60.0,
                color: Colors.grey,
              ),
              const Text("NAME",
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  )
              ),
              const SizedBox(height: 10.0),
              const Text("Shadow",
                  style: TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  )),
              const SizedBox(height: 30.0),
              const Text("CURRENT NINJA LEVEL",
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  )),
              const SizedBox(height: 10.0),
              const Text("69",
                  style: TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  )),
              const SizedBox(height: 30.0),
              Row(
                children: const <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "Ninja@gmail.com",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  )
                ],
              )
            ]
        ),
      ),
    );
  }
}
