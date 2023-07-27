import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';  // Package for interacting with third party api

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async{
    try{
      //make the request
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/Europe/London'));
      Map data = jsonDecode(response.body);
      //print(data);

      // get properties form the data
      String datetime = data['datetime'] ?? '';
      String offset = data['offset'] ?? '';
      //print(datetime);
      //print(offset);

      DateTime now = DateTime.parse(datetime);
      print(now);
    }
    catch(e){
      print('Error: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Text("Loading Screen")),
    );
  }
}
