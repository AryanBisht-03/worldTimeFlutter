import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;

    String bgImage = data['isDay'] ? 'daytime.png' : 'nightTime.png';
    Color textColor = data['isDay'] ? Colors.black54 : Colors.white;
    return Scaffold(
      body: SafeArea(child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assests/$bgImage'),
              fit: BoxFit.cover,
              ),
            ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
          child: Column(
            children: [
              FlatButton.icon(onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, "/location");
                setState(() {
                  // data = result as Map;
                  data = {
                    'location': result["location"],
                    'time': result["time"],
                    'flag': result["flag"],
                    'isDay': result["isDay"],
                  };
                });
                },
                  icon: Icon(Icons.edit_location,
                      color: textColor,),
                      label: Text("Edit Location",
                        style: TextStyle(
                          color: textColor),
                      )
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data["location"],
                    style: TextStyle(
                      fontSize: 50.0,
                      color: textColor,
                    ),
                    ),
                  ],
              ),
              SizedBox(height: 20,),
              Text(data['time'],
              style: TextStyle(
                fontSize: 50.0,
                color: textColor,
              ),),
            ],
          ),
        ),
      )),
    );
  }
}
