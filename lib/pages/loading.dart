import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_app/service/world_time_logic.dart';
import 'package:test_app/pass.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

String time = "LOADING";

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Europe/Berlin", flag: 'jkjj', url: "Europe/Berlin");
    await instance
        .getTime(); //cause gettime is async and its gonna take time for setting time property but whole code get back before that so
    //redirect to home page
    // print(instance.time + "gh");
    Navigator.of(context).pushReplacementNamed('/home',
        arguments: Pass(
            location: instance.location,
            flag: instance.flag,
            time: instance.time,
            isday: instance.isday));
    //setState(() {
    //     //this triggers build with new time value to change state
    //     time = instance.time;
    //   });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: SpinKitDoubleBounce(
            //spinner for loading
            color: Colors.white,
            size: 60.0,
          ),
        ));
  }
}
