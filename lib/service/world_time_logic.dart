import 'package:http/http.dart';
import 'dart:convert'; //for using jason decode
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the UI

  late String time; //the time in that location
  late String flag; //url to an asset flag icon
  String url = "Europe/Berlin"; //location url for end point
  late bool isday;
  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      final String jsonplaceholder =
          "http://worldtimeapi.org/api/timezone/$url";

      //this is like a promise like this is gonna return void after only after asyn code finish

      Response response = await get(Uri.parse(jsonplaceholder));
      //this argument will be treated as a string but to fetch data we need URI so uri.parse

      Map data = jsonDecode(response.body);
      //body property is actual json string that we get from get
      // //this looks like a map but actually a string  so we have to decode it to a map
//print (data['title']);after decode we can use it as a map
      //getting properties from data after decoding
      String datetime = data['datetime'];
      String offset = data['utc_offset']; //displacement
      offset = offset.substring(1, 3);
      //offset : +01:00 we want just the int part (01) and later we will convert it into int and add in now to show the time
      //using these 2 string we gonna create a datetime object

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //set time property
      isday = now.hour > 6 && now.hour < 20 ? true : false;
      // time = datetime;
      time = DateFormat.jm().format(now);
    } catch (e) {
      //exception handling
      print('caught error : $e');
      time = 'could not find the location/time';
    }
  }
}
