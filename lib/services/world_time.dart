import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{
  String location; //location name for the UI
  String time; //Time in the location
  String flag; //URL to asset flag icon
  String url; //http://worldtimeapi.org/api/timezone/ location URL for API endpoint


  WorldTime({this.location, this.flag, this.url});

  void getTime() async{
    //make the request
    Response response = await get("http://worldtimeapi.org/api/timezone/$url");

    Map data = jsonDecode(response.body);

    //print(data);

    //Get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    //print(datetime);
    //print(offset);

    //Create DateTime object

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    time = now.toString(); //Set the time property
  }
}