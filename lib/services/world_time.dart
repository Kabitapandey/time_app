import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name in UI
  String time; //time of that location
  String flag; //url to an flag icon
  String url; //url for api
  bool isDayTime; //true or false if daytime or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);

      now = now.add(Duration(hours: int.parse(offset)));
      // checking day or night
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

// set the time property
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("caught error $e");
      time = "couldn't load data";
    }
  }
}
