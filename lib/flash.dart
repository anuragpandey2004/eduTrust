import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_list_view/search_university.dart';
//import 'package:flutter_list_view/otp1.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'home.dart';
import 'welcome.dart';

class Flash extends StatefulWidget {
  @override
  State<Flash> createState() => _FlashState();
}

class _FlashState extends State<Flash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 1), () async {
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => Welcome()));
      // await Navigator.push(context, MaterialPageRoute(builder: (context)=>Welcome()),);
      whereToNavigate();

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your app name',
      home: Scaffold(
          body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Flash_Screen.png'),
                fit: BoxFit.cover)),
      )),
    );
  }

  Future whereToNavigate() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');

    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  SearchUniversityScreen()),
      );
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Welcome()));
    }
  }
}
