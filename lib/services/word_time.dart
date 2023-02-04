import "package:http/http.dart" as http;
import "dart:convert";
import "package:intl/intl.dart";

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDaytime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      final response = await http
          .get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);

      //get times properties
      String dateTime = data["datetime"];
      String offset = data["utc_offset"].substring(1, 3);
      //create datetime object
      DateTime currentTime = DateTime.parse(dateTime);
      currentTime = currentTime.add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(currentTime);
      isDaytime = currentTime.hour > 6 && currentTime.hour < 18 ? true : false;
    } on Exception catch (e) {
      time = e.toString();
    }
  }
}
