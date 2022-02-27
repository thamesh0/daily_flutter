import 'package:flutter/material.dart';
import 'package:time_app/pages/home.dart';
import 'package:time_app/pages/loading.dart';
import 'package:time_app/pages/choose_loc.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
    routes: {
      '/' : (context) => const Loading(),
      '/home' : (context) => const Home(),
      '/location' : (context) => const ChooseLocation(),
    },
)
);
