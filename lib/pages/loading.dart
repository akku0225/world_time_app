import 'package:flutter/material.dart';
import 'package:test_app/service/world_time_logic.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

String time = "LOADING";

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'location', flag: 'flag,jpg', url: '/uk/london');
    await instance
        .getTime(); //cause gettime is async and its gonna take time for setting time property but whole code get back before that so
    setState(() {
      //this triggers build with new time value to change state
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(30.0),
      child: Text(time),
    ));
  }
}
