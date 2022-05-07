import 'package:flutter/material.dart';
import 'package:worldclockapp/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void setupWorldTime() async {
    worldTime instance = worldTime(location: "Kolkata, India", flag: "india.png", url: "Asia/kolkata");
    await instance.getData();
    Navigator.pushReplacementNamed(context, "/home",arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDay': instance.isDay,
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.amber,
          size: 55.0,
        ),
      )
    );
  }
}
