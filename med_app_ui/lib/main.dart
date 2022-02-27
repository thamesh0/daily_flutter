import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      theme: ThemeData.dark(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color? bgclr = const Color(0xFF164D44);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Stack for putting 2 container on top of each other
      body: Stack(
        children: <Widget>[
          // 1st element : 1st container covers the Entire Screen
          Container(
              height: (MediaQuery.of(context).size.height),
              width: MediaQuery.of(context).size.width,
              color: bgclr,

              // Data inside
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Menu Button Icon
                    SafeArea(
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.menu))),

                    // Padded Heading
                    const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Text("Health assistance",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold))),
                    // Padded sub heading
                    const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child:
                            Text("""We always have a doctor on duty. So you can
get help within 30 minutes""", style: TextStyle(fontSize: 16))),

                    // Padded Textfield with rounded edges and filled body
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xff0c3e3a),
                          hintText: 'search by name or speciality',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0))),
                        ),
                      ),
                    )
                  ])),

          // Stack Top : 2nd Container is on top of it and covers 60% the screen
          // And starts from the bottom, so wrapped it in a column.
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 0.6 * (MediaQuery.of(context).size.height),

                // Using Box decoration to give round Edges on Top left and Top right
                // Alternative : Just use an image.
                decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),

                // Data Inside the 2nd Container.
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row with heading and Expand list button
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Specialities',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
                            TextButton(
                                onPressed: () {},
                                child: const Text("All >",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18)))
                          ]),
                      const SizedBox(height: 20),

                      // Row of Tiles with Categories, create a function to display this completely
                      Flexible(
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(20, (int index) {
                              return  Card(
                                color: Colors.greenAccent[(index + 1) * 100],
                                child:  Container(
                                  width: 130.0,
                                  height: 150.0,
                                ),
                              );
                            })),
                      ),
                      const SizedBox(height: 20),
                      const Text(" Hospitals near you",
                          style: TextStyle(color: Colors.grey, fontSize: 16)),
                      Flexible(
                        child: ListView(children: const [
                          ListTile(
                            leading: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Color(0xFF083F37),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0))),
                              ),
                            ),
                            title: Text("  Hospital 1",
                                style: TextStyle(color: Colors.black)),
                            subtitle: Text("  Hospital 1",
                                style: TextStyle(color: Colors.grey)),
                          ),
                        ]),
                      )
                    ],
                  ),
                ))
          ])
        ],
      ),
    );
  }
}
