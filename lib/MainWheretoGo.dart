import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notekeep/views/home_screen.dart';
import 'package:notekeep/views/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'notes and datas/sharedPref/sharedPref.dart';

class mainlog extends StatefulWidget {
  const mainlog({super.key});

  @override
  State<mainlog> createState() => _mainlogState();
}

class _mainlogState extends State<mainlog> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInstance();
    wheretoGo();
  }
  @override
  Widget build(BuildContext context) {
    return const splash_screen();
  }

  wheretoGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isloggedin = sharedPref.getBool(KEYLOGIN);

    Timer(const Duration(seconds: 0),(){
      if(isloggedin!=null){
        if(isloggedin){

          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context)=>const home_screen(
            ),
          ));
        }
        else{

          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context)=>const splash_screen(
            ),
          ));
        }
      }else{


        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context)=>const splash_screen(
          ),
        ));
      }
    }
    );
  }
}
