import 'package:flutter/material.dart';
import 'package:test_app/pass.dart';
import 'package:test_app/service/world_time_logic.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Pass;
    // String tt = data.time;
    // String ll = data.location;
    // bool idy = data.isday;
    // String fg = data.flag;

    // //day night bg
    String bgimage;
    Color bgcolor;
    if (data.isday) {
      bgcolor = Colors.blue;
    } else {
      bgcolor = Colors.indigo;
    }
    if (data.isday) {
      bgimage = "day.png";
    } else {
      bgimage = "night.png";
    }
    // print(data.time); //useless

    return Scaffold(
        backgroundColor: bgcolor,
        body: SafeArea(
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/$bgimage'),
                  fit: BoxFit.cover,
                )),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
                    child: Column(
                      children: [
                        FlatButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(context, '/location');
                            },
                            icon: Icon(Icons.edit_location,
                                color: Colors.blueGrey[800]),
                            label: Text('Edit Location',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.blueGrey[800]))),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              data.location,
                              style: TextStyle(
                                  fontSize: 28.0,
                                  letterSpacing: 2.0,
                                  color: Colors.blueGrey),
                            )
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          data.time,
                          style:
                              TextStyle(fontSize: 50.0, color: Colors.blueGrey),
                        )
                      ],
                    )))));
  }
}       
        

//route and passed time from location to added intl package(date time formate method),