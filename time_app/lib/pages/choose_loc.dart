import 'package:time_app/services/world_time.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata', loc: 'Kolkata', flag: 'india.png'),
    WorldTime(url: 'Europe/London', loc: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', loc: 'Berlin', flag: 'germany.png'),
    WorldTime(url: 'Africa/Cairo', loc: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', loc: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', loc: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', loc: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Jakarta', loc: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Seoul', loc: 'Seoul', flag: 'south_korea.png'),
  ];

  void updateTime(index) async {

    WorldTime instance = locations[index];

    await instance.getTime();
    Navigator.pop(context, {
      "location": instance.loc,
      "time": instance.time,
      "flag": instance.flag,
      "url": instance.url,
      "isDaytime": instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("Choose a Location"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].loc),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/${locations[index].flag}"),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
