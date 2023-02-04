// ignore_for_file: avoid_print, unused_local_variable, prefer_const_constructors, avoid_unnecessary_containers, use_build_context_synchronously

import 'package:flutter/material.dart';
import "package:miniman_wold_time_app/services/word_time.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String localTime = "the local time is loading please waite ...";
  void setLocalTime() async {
    WorldTime instance =
        WorldTime(flag: "cameroun", location: "yaounde", url: "Africa/Douala");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDaytime": instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setLocalTime();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.blue[900],
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SpinKitCircle(
            color: Colors.white,
            size: 70.0,
          ),
          Text(
            "loading time zone data ...",
            style: TextStyle(
                fontFamily: "AbrilFatface",
                fontSize: 10.0,
                color: Colors.white,
                decoration: TextDecoration.none),
          )
        ],
      ),
    ));
  }
}
