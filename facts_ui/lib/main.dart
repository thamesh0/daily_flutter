import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Facts App',
      home: FactsHome(),
    );
  }
}

class FactsHome extends StatefulWidget {
  const FactsHome({Key? key}) : super(key: key);

  @override
  _FactsHomeState createState() => _FactsHomeState();
}

class _FactsHomeState extends State<FactsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.tableCellsLarge),
              iconSize: 20,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        const SizedBox(height: 30),
        Row(children: const [
          SizedBox(width: 20),
          Text("Daily News",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))
        ]),
        const SizedBox(height: 15),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [
          Text("For you",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text("Weekly feed", style: TextStyle(fontSize: 22)),
          Text("Explore", style: TextStyle(fontSize: 22)),
        ]),
        const SizedBox(height: 30),
        ListTile(
          tileColor: Colors.white,
          leading: Container(
            width: 80,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage("https://images.theconversation.com/files/284770/original/file-20190718-116579-10hzuqo.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1356&h=668&fit=crop"),
              ),
            ),
          ),
          title: const Text("2 million people going to storm Area 51",
            style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
          subtitle: const Text("Important meme"),
        ),
      ]),
    );
  }
}
