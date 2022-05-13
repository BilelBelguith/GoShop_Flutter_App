import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../authentication/fireabse_auth.dart';

class WatchList extends StatefulWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      body:_drawWatchList() ,
    );
  }

  FirebaseAuthentication firebaseAuthentication = FirebaseAuthentication();
  String useruid() => firebaseAuthentication.getuid();
  CollectionReference Watch = FirebaseFirestore.instance.collection('WatchList');
  Widget _drawWatchList(){

    return  StreamBuilder<QuerySnapshot>(
      stream: Watch.where('uid' ,isEqualTo: useruid() ).snapshots(),
      //stream: Category.where('title' ,isEqualTo: "categ 2").snapshots(),
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
                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.brown,
                              blurRadius: 5.0,
                              spreadRadius: 5.0,
                              offset: Offset(5.0, 5.0), // shadow direction: bottom right
                            )
                          ],
                        ),

                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: Column(


                              children:[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(

                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.brown.shade800,
                                          child: const Text('PIC'),
                                          radius: 25,


                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [

                                        IconButton(

                                            onPressed: (){
                                              String id =snapshot.data!.docs[i].id;
                                              Watch.doc(id).delete();
                                              final snackBar = SnackBar(
                                                content:    Text(' This Product Removed From Your Cart'),
                                                backgroundColor: (Colors.black12),
                                                // action: SnackBarAction(
                                                //   label: 'dismiss',
                                                //   onPressed: () {
                                                //   },
                                                // ),
                                              );
                                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                            },
                                            icon: Icon(Icons.close ,
                                              color: Colors.red,

                                            )
                                        ),
                                        IconButton(onPressed: (){

                                          final snackBar = SnackBar(
                                            content:    Text(' This Product Added to Your Cart'),
                                            backgroundColor: (Colors.black12),
                                            // action: SnackBarAction(
                                            //   label: 'dismiss',
                                            //   onPressed: () {
                                            //   },
                                            // ),
                                          );
                                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                          CollectionReference carts = FirebaseFirestore.instance.collection('cart');
                                          final cartss = FirebaseFirestore.instance.collection('cart').doc();
                                          FirebaseAuth auth = FirebaseAuth.instance ;
                                          String uid = auth.currentUser!.uid.toString();
                                          carts.add(
                                              {
                                                'id' : cartss.id ,
                                                'uid' : uid ,
                                                'title': snapshot.data!.docs[i].get('title'),
                                                'price':snapshot.data!.docs[i].get('price'),
                                                'quan' : 1,

                                              }
                                          ).then((value) => print("Product Added"))
                                              .catchError((error) => print("Failed to add product: $error"));




                                        },
                                          icon: Icon( Icons.add_shopping_cart , ),
                                          color: Colors.black,

                                        ),
                                      ],
                                    ),
                                  ],
                                ),



                                Text("${snapshot.data!.docs[i].get('title')}" ,
                                    style: TextStyle(
                                      fontSize: 22 ,
                                      fontWeight:FontWeight.bold,
                                      letterSpacing: 3.0,

                                    )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Price "
                                        " :${snapshot.data!.docs[i].get('price') +'-DT-'}" ,
                                        style: TextStyle(
                                          fontSize: 15 ,
                                          fontWeight:FontWeight.bold,
                                          letterSpacing: 3.0,

                                        )),

                                  ],
                                ),


                              ]
                          ),





                      ),



                    ],
                  );
                });


        }
      },
    );
  }
}

