import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url:'Europe/London', location: 'London', flag:'uk.png'),
    WorldTime(url:'Europe/Berlin', location: 'Berlin', flag:'germany.png'),
    WorldTime(url:'Africa/Cairo', location: 'Cario', flag:'egypt.png'),
    WorldTime(url:'Africa/Nairobi', location: 'Nairobi', flag:'kenya.jpg'),
    WorldTime(url:'America/Chicago', location: 'Chicago', flag:'chicago.png'),
    WorldTime(url:'America/New_York', location: 'New York', flag:'ny.jpg'),
    WorldTime(url:'Asia/Seoul', location: 'Seoul', flag:'seoul.png'),
    WorldTime(url:'Asia/Jakarta', location: 'Jakarta', flag:'indonesia.jpg'),
    WorldTime(url:'Asia/Kolkata', location: 'India', flag:'india.png'),
    WorldTime(url:'Asia/Tokyo', location: 'Japan', flag:'japan.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('initState function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      // body: ElevatedButton(
      //   onPressed: () {
      //     setState(() {
      //       counter+=1;
      //     });
      //   },
      //   child: Text('counter is $counter'),
      // ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}') ,
                )
              ),
            ),
          );
        }
      )
    );
  }
}
