// ignore_for_file: prefer_const_constructors
import "package:miniman_wold_time_app/pages/choose_location.dart";
import "package:miniman_wold_time_app/pages/home.dart";
import "package:miniman_wold_time_app/pages/loading.dart";

Map routes = {
  "/": (context) => Loading(),
  "/home": (context) => Home(),
  "/location": (context) => ChooseLocation()
};
