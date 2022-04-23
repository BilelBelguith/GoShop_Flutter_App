import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:projectpfe/screen/welcome_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:4), (){
      Navigator.push(context,MaterialPageRoute(builder: (context) => const WelcomeScreen()));

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover
                , image: AssetImage('assets/welcomescreen1.png')
            )
        ) ,

        child:Center(
            child :Column(
              children: [
                SizedBox(height: 450),
              Container(

              padding: EdgeInsets.all(30),
            child :LinearProgressIndicator(
              minHeight: 5,
              backgroundColor: Colors.brown[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.brown),
            ),),]
            ),
        )
      )

      ,
    );
  }
}
