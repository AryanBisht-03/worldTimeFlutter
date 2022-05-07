import 'package:flutter/material.dart';
import 'package:worldclockapp/Pages/home.dart';
import 'package:worldclockapp/Pages/loading.dart';
import 'package:worldclockapp/Pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    // home: LoadingScreen(),
    initialRoute: '/',
    routes: {
      '/': (context) => LoadingScreen(),
      '/home': (context)=> Home(),
      '/location': (context)=> ChooseLocation(),
    },
  )
  );
}
