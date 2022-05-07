import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class worldTime{

  String location;
  late String time;
  String flag;
  String url;
  late bool isDay;

  worldTime({required this.location,required this.flag,required this.url});

  Future<void> getData() async {
    try{
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      print(data);

      String dateTime = data['datetime'];
      String offset = data["utc_offset"].substring(1,3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      print("$dateTime $offset");
      print("$now");

      isDay = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e)
    {
      print("Error $e");
      time = "Error while loading data";
    }
  }
}