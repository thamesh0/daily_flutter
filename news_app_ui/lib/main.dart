import 'package:flutter/material.dart';
import 'package:newsappui/pages/utilities/screens/home.dart';
void main() => runApp(MaterialApp(
  initialRoute: '/homepage',
  routes: {
    '/homepage':(context) => const Home(),
  },
));