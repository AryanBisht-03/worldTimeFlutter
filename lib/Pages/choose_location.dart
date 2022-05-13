import 'package:flutter/material.dart';
import 'package:worldclockapp/Services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<worldTime> locations = [
    worldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    worldTime(location: 'Berlin', flag: 'berlin.png', url: 'Europe/Berlin'),
    worldTime(location: 'Cairo', flag: 'cairo.png', url: 'Africa/Cairo'),
    worldTime(location: 'New York', flag: 'usa.png', url: 'America/New_York'),
    worldTime(location: "Kolkata, India", flag: "india.png", url: "Asia/kolkata"),
    worldTime(location: 'Los Angeles', flag: 'usa.png', url: 'America/Los_Angeles'),
    worldTime(location: 'Mexico City', flag: 'usa.png', url: 'America/Mexico_City'),
  ];


  void updateTime(index) async {
      worldTime instance = locations[index];
      await instance.getData();
      Navigator.pop(context,{
        'location': instance.location,
        'time': instance.time,
        'flag': instance.flag,
        'isDay': instance.isDay,
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(itemBuilder: (context,index){
            return Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assests/${locations[index].flag}"),
                  ),
                ),
              ),
            );
        },
        itemCount: locations.length,
      ),
    );
  }
}
