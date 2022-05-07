

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../authentication/fireabse_auth.dart';
import '../../user/user.dart';
import '../signin_shop_owner.dart';


class ProfileOwner extends StatefulWidget {
  const ProfileOwner({Key? key}) : super(key: key);

  @override
  State<ProfileOwner> createState() => _ProfileOwnerState();
}

class _ProfileOwnerState extends State<ProfileOwner> {
  TextEditingController _updaterfn = TextEditingController();
  TextEditingController _updaterln = TextEditingController();
  TextEditingController _updaterph = TextEditingController();

  CollectionReference shopowner = FirebaseFirestore.instance.collection('ShopOwner');

  FirebaseAuthentication firebaseAuthentication = FirebaseAuthentication();



String useruid() => firebaseAuthentication.getuid();

  // @override
  // void initState(){
  //   super.initState();
  //   firebaseAuthentication.getCurrentUser();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        backgroundColor: Colors.brown[200],
        appBar: AppBar(

            backgroundColor: Colors.brown,
            shape: RoundedRectangleBorder(
                borderRadius:  BorderRadius.only(
                  bottomRight: Radius.circular(70),
                )
            ),
            elevation: 4,
            title: Center(
              child :Text('Your Profile' ,
                style: TextStyle(
                  fontSize: 22 ,
                  fontWeight:FontWeight.bold,
                  letterSpacing: 3.0,

                ),),
            )
        ),


      body: _drawUser()



    )
    );
  }




  Widget _drawUser(){

    return  StreamBuilder<QuerySnapshot>(

      stream: shopowner.where('uid' ,isEqualTo: useruid() ).snapshots(),
      builder: (BuildContext context , AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return Text('Error : ${snapshot.error}');

        switch (snapshot.connectionState) {
          case ConnectionState.waiting :
            return Container(
              color: Colors.brown[200],
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.brown,
                ),
              ) ,
            );
          default :
            return new ListView.builder(
                itemCount: snapshot.data!.docs.length ,
                itemBuilder: (context , i){
                  return  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),

                      Text("First Name :" ,
                          style: TextStyle(
                            color: Colors.brown,
                            fontSize: 22 ,
                            fontWeight:FontWeight.bold,
                            letterSpacing: 2.0,

                          )),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(50, 5, 50, 5),

                              child :Text("${snapshot.data!.docs[i].get('first_Name')}" ,
                                  style: TextStyle(
                                    fontSize: 20 ,
                                    fontWeight:FontWeight.bold,
                                    letterSpacing: 3.0,

                                  )
                              )
                          ),
                          IconButton(

                              onPressed: (){
                                showDialog(

                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(

                                          backgroundColor: Colors.brown[200],
                                          elevation: 20,
                                          title: Center(child :
                                          Text("Update your Name",
                                              style: TextStyle(
                                                fontSize: 22 ,
                                                fontWeight:FontWeight.bold,
                                                letterSpacing: 2.0,)
                                          ),
                                          ),
                                          content: TextFormField(
                                            cursorColor: Colors.brown,
                                            decoration: InputDecoration(

                                              hintText: 'New Name',
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
                                            controller: _updaterfn,
                                          ),

                                          actions :[
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.brown,

                                              ),
                                              child: Container(
                                                //padding: EdgeInsets.fromLTRB(26, 1, 26, 1),
                                                  child:Text('CONFIRM',style: TextStyle(
                                                    fontSize: 15 ,
                                                    fontWeight:FontWeight.bold,
                                                    letterSpacing: 2.0,

                                                  ),)
                                              ),
                                              onPressed: (){
                                                String id =snapshot.data!.docs[i].id;
                                                shopowner.doc(id).update({ 'first_Name' : _updaterfn.text });
                                                _updaterfn.clear();

                                              },
                                            ),

                                          ]


                                      );
                                    }

                                );

                                // String id =snapshot.data!.docs[i].id;
                                // Category.doc(id).update({ 'title' : "New trainer" });
                                //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> UpdateCategory(value: '',)));

                              },
                              icon: Icon(Icons.update ,
                                color: Colors.green,

                              )
                          ),
                        ],
                      ),
                      Text("Last Name :" ,
                          style: TextStyle(
                            color: Colors.brown,
                            fontSize: 22 ,
                            fontWeight:FontWeight.bold,
                            letterSpacing: 2.0,

                          )),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(50, 5, 10, 5),

                              child :Text("${snapshot.data!.docs[i].get('last_Name')}" ,
                                  style: TextStyle(
                                    fontSize: 20 ,
                                    fontWeight:FontWeight.bold,
                                    letterSpacing: 3.0,

                                  )
                              )
                          ),
                          IconButton(

                              onPressed: (){
                                showDialog(

                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(

                                          backgroundColor: Colors.brown[200],
                                          elevation: 20,
                                          title: Center(child :
                                          Text("Update your L-Name",
                                              style: TextStyle(
                                                fontSize: 22 ,
                                                fontWeight:FontWeight.bold,
                                                letterSpacing: 2.0,)
                                          ),
                                          ),
                                          content: TextFormField(
                                            cursorColor: Colors.brown,
                                            decoration: InputDecoration(

                                              hintText: 'New Last Name',
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
                                            controller: _updaterln,
                                          ),

                                          actions :[
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.brown,

                                              ),
                                              child: Container(
                                                //padding: EdgeInsets.fromLTRB(26, 1, 26, 1),
                                                  child:Text('CONFIRM',style: TextStyle(
                                                    fontSize: 15 ,
                                                    fontWeight:FontWeight.bold,
                                                    letterSpacing: 2.0,

                                                  ),)
                                              ),
                                              onPressed: (){
                                                String id =snapshot.data!.docs[i].id;
                                                shopowner.doc(id).update({ 'last_Name' : _updaterln.text });
                                                _updaterln.clear();

                                              },
                                            ),

                                          ]


                                      );
                                    }

                                );



                              },
                              icon: Icon(Icons.update ,
                                color: Colors.green,

                              )
                          ),
                        ],
                      ),
                      Text("Phone :" ,
                          style: TextStyle(
                            color: Colors.brown,
                            fontSize: 22 ,
                            fontWeight:FontWeight.bold,
                            letterSpacing: 2.0,

                          )),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(50, 5, 10, 5),

                              child :Text("${snapshot.data!.docs[i].get('phone')}" ,
                                  style: TextStyle(
                                    fontSize: 20 ,
                                    fontWeight:FontWeight.bold,
                                    letterSpacing: 3.0,

                                  )
                              )
                          ),
                          IconButton(

                              onPressed: (){
                                showDialog(

                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(

                                          backgroundColor: Colors.brown[200],
                                          elevation: 20,
                                          title: Center(child :
                                          Text("Update Phone Number",
                                              style: TextStyle(
                                                fontSize: 22 ,
                                                fontWeight:FontWeight.bold,
                                                letterSpacing: 2.0,)
                                          ),
                                          ),
                                          content: TextFormField(
                                            cursorColor: Colors.brown,
                                            decoration: InputDecoration(

                                              hintText: 'New Phone Number',
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
                                            controller: _updaterph,
                                          ),

                                          actions :[
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.brown,

                                              ),
                                              child: Container(
                                                //padding: EdgeInsets.fromLTRB(26, 1, 26, 1),
                                                  child:Text('CONFIRM',style: TextStyle(
                                                    fontSize: 15 ,
                                                    fontWeight:FontWeight.bold,
                                                    letterSpacing: 2.0,

                                                  ),)
                                              ),
                                              onPressed: (){
                                                String id =snapshot.data!.docs[i].id;
                                                shopowner.doc(id).update({ 'phone' : _updaterph.text });
                                                _updaterph.clear();

                                              },
                                            ),

                                          ]


                                      );
                                    }

                                );



                              },
                              icon: Icon(Icons.update ,
                                color: Colors.green,

                              )
                          ),
                        ],
                      ),
                      Text("Gender :" ,
                          style: TextStyle(
                            color: Colors.brown,
                            fontSize: 22 ,
                            fontWeight:FontWeight.bold,
                            letterSpacing: 2.0,

                          )),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(50, 5, 10, 5),

                              child :Text("${snapshot.data!.docs[i].get('gender')}" ,
                                  style: TextStyle(
                                    fontSize: 20 ,
                                    fontWeight:FontWeight.bold,
                                    letterSpacing: 3.0,

                                  )
                              )
                          ),

                        ],
                      ),
                      SizedBox(height: 20),















                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.brown,

                        ),
                        child: Container(
                            padding: EdgeInsets.fromLTRB(26, 1, 26, 1),
                            child:Text('LOGOUT',style: TextStyle(
                              fontSize: 15 ,
                              fontWeight:FontWeight.bold,
                              letterSpacing: 2.0,

                            ),)
                        ),
                        onPressed: (){
                          firebaseAuthentication.signOut();
                          Navigator.push(context,MaterialPageRoute(builder: (context) => const SignInShopOwner()));

                        },
                      ),
                    ],
                  );
                });


        }
      },
    );
  }
}
