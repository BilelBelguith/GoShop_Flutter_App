import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:projectpfe/screen/register_page.dart';
import 'package:projectpfe/screen/signin_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: double.infinity,

              child: Column(
                children: [
                  SizedBox(height: 100),
                  Card(
                    elevation: 10.0,
                    margin: EdgeInsets.all(14),
                    color: Colors.brown[200],
                    child: FlipCard(
                      direction: FlipDirection.VERTICAL,
                      speed: 1000,
                      front: Container(
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(12),
                              child :Text('   JOIN AS A CUSTOMER  ',

                                style: TextStyle(
                                  fontSize: 22 ,
                                  fontWeight:FontWeight.bold,
                                  letterSpacing: 2.0,

                                ),
                              ),),

                          ],
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.brown,

                              ),
                              child: Container(
                                  padding: EdgeInsets.fromLTRB(26, 1, 26, 1),
                                  child:Text('LOGIN',style: TextStyle(
                                    fontSize: 15 ,
                                    fontWeight:FontWeight.bold,
                                    letterSpacing: 2.0,

                                  ),)
                              ),
                              onPressed: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context) => const SignIn()));
                              },
                            ),
                            SizedBox(width: 25),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.brown,

                              ),
                              child: Container(
                                  padding: EdgeInsets.fromLTRB(20, 1, 20, 1),
                                  child:Text('REGISTER',style: TextStyle(
                                    fontSize: 15 ,
                                    fontWeight:FontWeight.bold,
                                    letterSpacing: 2.0,

                                  ),)
                              ),
                              onPressed: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context) => const Register()));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Card(
                    elevation: 10.0,
                    margin: EdgeInsets.all(18),
                    color: Colors.brown[200],
                    child: FlipCard(
                      direction: FlipDirection.VERTICAL,
                      speed: 1000,
                      front: Container(
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(12),
                              child :Text('   JOIN AS A SELLER  ',
                                style: TextStyle(
                                  fontSize: 22 ,
                                  fontWeight:FontWeight.bold,
                                  letterSpacing: 2.0,

                                ),
                              ),),

                          ],
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.brown,

                              ),
                              child: Container(
                                  padding: EdgeInsets.fromLTRB(26, 1, 26, 1),
                                  child:Text('LOGIN',
                                    style: TextStyle(
                                      fontSize: 15 ,
                                      fontWeight:FontWeight.bold,
                                      letterSpacing: 2.0,

                                    ),)
                              ),
                              onPressed: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context) => const SignIn()));
                              },
                            ),
                            SizedBox(width: 25),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.brown,

                              ),
                              child: Container(
                                  padding: EdgeInsets.fromLTRB(20, 1, 20, 1),
                                  child:Text('REGISTER',style: TextStyle(
                                    fontSize: 15 ,
                                    fontWeight:FontWeight.bold,
                                    letterSpacing: 2.0,

                                  ),)
                              ),
                              onPressed: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context) => const Register()));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),


                ],
              ),

            )
          ],
        ),
      )

      ,
    );
  }
}
