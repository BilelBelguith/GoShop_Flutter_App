

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projectpfe/screen/signin_page.dart';

import '../authentication/fireabse_auth.dart';


String? emailInputValidator(value) {
  if (value.isEmpty ||
      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
          .hasMatch(value)) {
    return "Mail is invalid";
  }
  return null;
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);


  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordControllercheck = TextEditingController();
  TextEditingController  _firstNameController = TextEditingController();
  TextEditingController  _lastNameController = TextEditingController();
  TextEditingController  _phoneController = TextEditingController();
  TextEditingController _streetNameController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _streetNumberController = TextEditingController();
  TextEditingController _posteCodeController = TextEditingController();



String _value =''  ;



  FirebaseAuthentication firebaseAuthentication = FirebaseAuthentication();




  @override
  void initState(){
    super.initState();
    firebaseAuthentication.getCurrentUser();
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _passwordControllercheck.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
      //   elevation: 4,
      //     title: Center(
      //       child :Text('Create Your Account' ,
      //       style: TextStyle(
      //         fontSize: 22 ,
      //         fontWeight:FontWeight.bold,
      //         letterSpacing: 2.0,
      //
      //       ),),
      //     )
      // ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover
                , image: AssetImage('assets/register1.jpg')
            )
        ),
        padding: EdgeInsets.only(left: 25 , right: 25),
        child: Center(
          child: Form(
            key: _formKey,
            child :SingleChildScrollView(child :Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover
                        , image: AssetImage('assets/register2-PhotoRoom.png')
                    )
                ),
              ),




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
                validator: emailInputValidator ,

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
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },

              ),
              SizedBox(height: 20),
              TextFormField(
                cursorColor: Colors.brown,
                controller: _passwordControllercheck,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    color: Colors.brown,
                  ),
                  labelText: 'Confirm Password',
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
                validator: (String? value) {
                  if (value == null || value.isEmpty  ) {
                    return 'Check your password';
                  }
                  return null;
                },

              ),
              SizedBox(height: 20),


              Divider(
                color: Colors.brown,
                height: 10,
                thickness: 2,
                indent: 30,
                endIndent: 30,
              ),

              Text('More Information' ,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15 ,
                        fontWeight:FontWeight.bold,
                        letterSpacing: 2.0,

                      ),),
              Divider(
                color: Colors.brown,
                height: 10,
                thickness: 2,
                indent: 30,
                endIndent: 30,
              ),

              SizedBox(height: 20),



              TextFormField(
                cursorColor: Colors.brown,
                controller: _firstNameController,

                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.people,
                    color: Colors.brown,
                  ),
                  labelText: 'First Name',
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
                validator: (String? value) {
                  if (value == null || value.isEmpty  ) {
                    return 'Please enter some text';
                  }
                  return null;
                },

              ),

              SizedBox(height: 20),

              TextFormField(
                cursorColor: Colors.brown,
                controller: _lastNameController,

                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.people,
                    color: Colors.brown,
                  ),
                  labelText: 'Last Name',
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
                validator: (String? value) {
                  if (value == null || value.isEmpty  ) {
                    return 'Please enter some text';
                  }
                  return null;
                },

              ),

              SizedBox(height: 20),

              TextFormField(

                cursorColor: Colors.brown,
                controller: _phoneController,

                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.brown,
                  ),
                  labelText: 'Phone Number',
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
                validator: (String? value) {
                  if (value == null || value.isEmpty  ) {
                    return 'Please enter some text';
                  }
                  return null;
                },

              ),

              SizedBox(height: 10),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio<String>(
                      activeColor: Colors.brown,

                    value: "Male",
                    groupValue: _value,
                    onChanged: (value){
                      setState((){
                        _value = value! ;
                      });
                    }
                  ),
                  Text("Male" , style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15 ,
                    fontWeight:FontWeight.bold,
                    letterSpacing: 2.0,

                  ),),
                  Radio<String>(
                      activeColor: Colors.brown,
                    value: "Female",
                    groupValue: _value,
                    onChanged:(value){
                      setState((){
                        _value = value! ;
                      });
                    }
                  ),
                  Text("Female" , style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15 ,
                    fontWeight:FontWeight.bold,
                    letterSpacing: 2.0,

                  ),),
                  Radio<String>(
                      activeColor: Colors.brown,
                    value: "Other",
                    groupValue: _value,
                    onChanged: (value){
                      setState((){
                        _value = value! ;

                      });
                    }
                  ),
                  Text("Other" ,style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15 ,
                    fontWeight:FontWeight.bold,
                    letterSpacing: 2.0,

                  ),),
                ],
              ),
              SizedBox(height: 10),

              Divider(
                color: Colors.brown,
                height: 10,
                thickness: 2,
                indent: 30,
                endIndent: 30,
              ),

              Text('Address Information' ,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15 ,
                  fontWeight:FontWeight.bold,
                  letterSpacing: 2.0,

                ),),
              Divider(
                color: Colors.brown,
                height: 10,
                thickness: 2,
                indent: 30,
                endIndent: 30,
              ),
              SizedBox(height: 20),

              TextFormField(

                cursorColor: Colors.brown,
                controller: _cityController,


                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.location_city,
                    color: Colors.brown,
                  ),
                  labelText: 'City',
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
                validator: (String? value) {
                  if (value == null || value.isEmpty  ) {
                    return 'Please enter some text';
                  }
                  return null;
                },

              ),
              SizedBox(height: 20),
              TextFormField(

                cursorColor: Colors.brown,
                controller: _countryController,


                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.map,
                    color: Colors.brown,
                  ),
                  labelText: 'Country',
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
                validator: (String? value) {
                  if (value == null || value.isEmpty  ) {
                    return 'Please enter some text';
                  }
                  return null;
                },

              ),
              SizedBox(height: 20),
              TextFormField(

                cursorColor: Colors.brown,
                controller: _streetNameController,


                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.add_location,
                    color: Colors.brown,
                  ),
                  labelText: 'Street Name',
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
                validator: (String? value) {
                  if (value == null || value.isEmpty  ) {
                    return 'Please enter some text';
                  }
                  return null;
                },

              ),
              SizedBox(height: 20),
              TextFormField(

                cursorColor: Colors.brown,
                controller: _streetNumberController,

                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.streetview,
                    color: Colors.brown,
                  ),
                  labelText: 'Street Number',
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
                validator: (String? value) {
                  if (value == null || value.isEmpty  ) {
                    return 'Please enter some text';
                  }
                  return null;
                },

              ),
              SizedBox(height: 20),
              TextFormField(

                cursorColor: Colors.brown,
                controller: _posteCodeController,

                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.local_post_office_outlined,
                    color: Colors.brown,
                  ),
                  labelText: 'Post Code',
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
                validator: (String? value) {
                  if (value == null || value.isEmpty  ) {
                    return 'Please enter some text';
                  }
                  return null;
                },

              ),
              SizedBox(height: 20),


















              SizedBox(height: 10),

              ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    primary: Colors.brown,

                  ),
                  child:Container(
                      padding: EdgeInsets.fromLTRB(18, 1, 18, 1),
                      child:Text('REGISTER',
                        style: TextStyle(
                          fontSize: 15 ,
                          fontWeight:FontWeight.bold,
                          letterSpacing: 2.0,

                        ),)
                  ),
                  onPressed: ()async{
                    if (_formKey.currentState!.validate()) {
                      try{
                        String email = _emailController.text ;
                        String password = _passwordControllercheck.text;
                        var user = await firebaseAuthentication.register(email, password);
                        customerSetup();
                        //success
                          print(user!.uid);
                        Navigator.push(context,MaterialPageRoute(builder: (context) => const SignIn()));

                        //check this navigator kenou khyr n7ot hetha
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const SignIn()));

                      }on FirebaseAuthException catch (e) {



                          print(e);
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(

                                  backgroundColor: Colors.brown[200],
                                  elevation: 20,
                                  title: Center(child :
                                  Text("Error",
                                  style: TextStyle(
                                fontSize: 22 ,
                                fontWeight:FontWeight.bold,
                                letterSpacing: 2.0,)
                                  ),
                                  ),
                                  content: Text(e.message.toString() , style: TextStyle(
                                    fontSize: 15 ,
                                    fontWeight:FontWeight.bold,
                                    letterSpacing: 2.0,)),

                                );
                              }
                              );
                      }
                    }
                  })
            ],
          ),)
          ),
        ),
      ),


    );
  }
  Future<void> customerSetup ( ) async {
    CollectionReference costumers = FirebaseFirestore.instance.collection('Customers');
    final costomerr = FirebaseFirestore.instance.collection('Customers').doc();
    FirebaseAuth auth = FirebaseAuth.instance ;
    String uid = auth.currentUser!.uid.toString();
    costumers.add({
      'id' : costomerr.id ,
      'uid' : uid ,
      'first_Name' : _firstNameController.text,
      'last_Name' : _lastNameController.text ,
      'phone' : _phoneController.text ,
      'gender' : _value ,
      'city' : _cityController.text ,
      'country' : _countryController.text ,
      'street_Name' : _streetNameController.text,
      'street_number': _streetNumberController.text,
      'Poste_Code' :_posteCodeController.text ,

    });
    return;
  }

}
