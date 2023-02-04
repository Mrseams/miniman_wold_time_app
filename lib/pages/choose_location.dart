// ignore_for_file: prefer_const_constructors
import "package:miniman_wold_time_app/services/word_time.dart";
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: "London", flag: "uk.png", url: "Europe/London"),
    WorldTime(location: "Berlin", flag: "germany.png", url: "Europe/Berlin"),
    WorldTime(location: "Cairo", flag: "Egypht.png", url: "Africa/Cairo"),
    WorldTime(location: "Nairobi", flag: "kenya.png", url: "Africa/Nairobi"),
    WorldTime(location: "Chicago", flag: "usa.png", url: "America/Chicago"),
    WorldTime(location: "Jakarta", flag: "indonesia.png", url: "Asia/Jakarta"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text("choose a location"),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Locations",
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 2.0),
                itemCount: locations.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        print(locations[index].location);
                      },
                      title: Text(locations[index].location),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
