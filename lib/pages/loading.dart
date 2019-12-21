import 'package:flutter/material.dart';
import 'package:world_app/services/world_time.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = "loading";
  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: "Lagos", flag: "nigeria.png", url: "Africa/Lagos");
    await instance.getTime();
    /*setState(() {
      time = instance.time;
    });*/

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
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
        padding: EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}
