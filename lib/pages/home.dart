// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments;
    String bgImg = data["isDaytime"] ? "day.jpg" : "night.jpg";
    Color? bgColor =
        data["isDaytime"] ? Colors.blue[700] : Colors.black; //print(data);
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/$bgImg'), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data["location"],
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "AbrilFatface",
                    fontSize: 30.0,
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                data["time"],
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "AbrilFatface",
                    fontSize: 45.0,
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, "/location");
                  },
                  style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0)),
                  icon: Icon(
                    Icons.edit_location,
                  ),
                  label: Text(
                    "Edit location",
                    style: TextStyle(
                      fontFamily: "AbrilFatface",
                    ),
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
