import 'package:flutter/material.dart';

import '../authentication/fireabse_auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  FirebaseAuthentication firebaseAuthentication = FirebaseAuthentication();




  // @override
  // void initState(){
  //   super.initState();
  //   firebaseAuthentication.getCurrentUser();
  // }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      // appBar: AppBar(
      //
      //     backgroundColor: Colors.brown,
      //     // shape: RoundedRectangleBorder(
      //     //     borderRadius:  BorderRadius.only(
      //     //         bottomRight: Radius.circular(70),
      //     //         bottomLeft: Radius.circular(70))
      //     // ),
      //     elevation: 4,
      //     title: Center(
      //       child :Text('Log To Your Account' ,
      //         style: TextStyle(
      //           fontSize: 22 ,
      //           fontWeight:FontWeight.bold,
      //           letterSpacing: 2.0,
      //
      //         ),),
      //     )
      // ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover
                , image: AssetImage('assets/login.png')
            )
        ),
        padding: EdgeInsets.only(left: 25 , right: 25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              SizedBox(height: 20),
              TextFormField(
                cursorColor: Colors.brown,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.account_box,
                    color: Colors.brown,
                  ),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.brown),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.brown,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.brown,
                      width: 2.0,
                    ),
                  ),

                ),

              ),
              SizedBox(height: 20),
              TextFormField(
                cursorColor: Colors.brown,
                controller: _passwordController,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    color: Colors.brown,
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.brown),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.brown,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.brown,
                      width: 2.0,
                    ),
                  ),

                ),

              ),
              SizedBox(height: 20),



              ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    primary: Colors.brown,

                  ),
                  child:Container(
                      padding: EdgeInsets.fromLTRB(18, 1, 18, 1),
                      child:Text('SIGN IN',
                        style: TextStyle(
                          fontSize: 15 ,
                          fontWeight:FontWeight.bold,
                          letterSpacing: 2.0,

                        ),)
                  ),
                  onPressed: ()async{
                    String email = _emailController.text ;
                    String password = _passwordController.text;
                    var user = await firebaseAuthentication.signIn(email, password);
                    print(user);


                  })
            ],
          ),
        ),
      ),


    );
  }
}

