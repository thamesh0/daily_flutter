import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String loc; // name of location
  String flag; // flag of that location
  String url; // location url for api endpoint
  late String time; // time in that location
  late bool? isDaytime; // Day or night for background img

  WorldTime({required this.loc, required this.url, required this.flag});

  DateTime addOffset(now, offsethr, offsetmin) {
    now = now.add(
        Duration(hours: int.parse(offsethr), minutes: int.parse(offsetmin)));
    return now;
  }

  DateTime subOffset(DateTime now, String offsethr, String offsetmin) {
    now = now.subtract(
        Duration(hours: int.parse(offsethr), minutes: int.parse(offsetmin)));
    return now;
  }

  Future<void> getTime() async {
    //  TODO: Simulate a network request
    http.Response res =
        await http.get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
    Map data = jsonDecode(res.body);

    // Get local time and offset from json data
    String datetime = data['datetime'];
    String offsethr = data['utc_offset'].substring(1, 3);
    String offsetmin = data['utc_offset'].substring(4, 6);

    // Create a datetime object
    DateTime now = DateTime.parse(datetime);

    bool? chk = data['utc_offset'].substring(0, 1) == '+';
    chk
        ? now = addOffset(now, offsethr, offsetmin)
        : now = subOffset(now, offsethr, offsetmin);
    // Set the timer
    isDaytime = now.hour > 6 && now.hour < 19;
    time = DateFormat.jm().format(now);
  }
}
