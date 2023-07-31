import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class WorldTime{

  late String location;
  late String time = '';
  late String flag;   // url to asset flag icon
  late String url;

  WorldTime({required this.location, required this.flag, required this.url});

  Future <void> getTime() async{
    try{
      //make the request
      Uri apiUrl = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
      Response response = await get(apiUrl);
      Map data = jsonDecode(response.body);
      //print(data);

      // get properties form the data
      String datetime = data['datetime'] ?? '';
      String offset = data['offset'] ?? '';
      //print(datetime);
      //print(offset);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //print(now);
      time = now.toString();

    }
    catch(e){
      print('Error: $e');
      time = 'Could not get time data';
    }
  }
}