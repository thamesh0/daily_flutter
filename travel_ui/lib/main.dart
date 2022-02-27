import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Figma to flutter practice",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> countries = ['japan','barcelona','greece','rome'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.notifications)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.extension))
              ],
            ),
            const SizedBox(height: 10),
            const Text.rich(
                TextSpan(
                    text: "Welcome, ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: "Prathamesh",
                          style: TextStyle(fontWeight: FontWeight.normal))
                    ]),
                style: TextStyle(fontSize: 45)),
            const SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, size: 18),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
            const SizedBox(height: 30),
            const Text("Saved Places",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
            const SizedBox(height: 30),
            SizedBox(
              height: 300,
              child: GridView.count(crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  padding: EdgeInsets.zero,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                for (String country in countries)
                  Image.asset('images/$country.png')
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
