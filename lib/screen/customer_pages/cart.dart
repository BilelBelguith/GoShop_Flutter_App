import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../authentication/fireabse_auth.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      PreferredSize(
        preferredSize:Size.fromHeight(110.0),
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,


                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.only(
                      bottomRight: Radius.circular(70),
                    )
                ),
                elevation: 4,
                title: Center(
                  child :Text('Shop Cart' ,
                    style: TextStyle(
                      fontSize: 22 ,
                      fontWeight:FontWeight.bold,
                      letterSpacing: 3.0,

                    ),),
                )
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.brown,

              ),
              child: Container(
                  padding: EdgeInsets.fromLTRB(26, 1, 26, 1),
                  child:Text('Checkout',style: TextStyle(
                    fontSize: 15 ,
                    fontWeight:FontWeight.bold,
                    letterSpacing: 2.0,

                  ),)
              ),
              onPressed: (){



                  showDialog(

                      context: context,
                      builder: (context) {
                        return AlertDialog(

                            backgroundColor: Colors.brown[200],
                            elevation: 20,
                            title: Center(child :
                            Text("Your Order",
                                style: TextStyle(
                                  fontSize: 22 ,
                                  fontWeight:FontWeight.bold,
                                  letterSpacing: 2.0,)
                            ),
                            ),
                            content: Container(
                              // color: Colors.white70,
                               height: 250,
                              // width: 50,
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [


                                      Text('Totale : ' ,
                                          style: TextStyle(
                                            fontSize: 18 ,
                                            fontWeight:FontWeight.bold,
                                            letterSpacing: 2.0,)
                                      ),
                                      Text('2500 -DT-' ,
                                          style: TextStyle(
                                            fontSize: 18 ,
                                            fontWeight:FontWeight.bold,
                                            letterSpacing: 2.0,)
                                      ),



                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Text("Payment",
                                      style: TextStyle(
                                        fontSize: 22 ,
                                        fontWeight:FontWeight.bold,
                                        letterSpacing: 2.0,)
                                  ),
                                    Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          Radio<String>(
                                              activeColor: Colors.brown,

                                              value: "Cash on Delivery",
                                              groupValue: _value,
                                              onChanged: (value){
                                                setState((){
                                                  _value = value! ;
                                                });
                                              }
                                          ),
                                          Text("Cash on Delivery" , style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15 ,
                                            fontWeight:FontWeight.bold,
                                            letterSpacing: 2.0,

                                          ),),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Radio<String>(
                                              activeColor: Colors.brown,
                                              value: "Credit Card",
                                              groupValue: _value,
                                              onChanged:(value){
                                                setState((){
                                                  _value = value! ;
                                                });
                                              }
                                          ),
                                          Text("Credit Card" , style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15 ,
                                            fontWeight:FontWeight.bold,
                                            letterSpacing: 2.0,

                                          ),),
                                        ],
                                      ),




                                    ],
                                  ),
                                ],
                              ),





                            ),

                            actions :[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.brown,

                                ),
                                child: Container(
                                  //padding: EdgeInsets.fromLTRB(26, 1, 26, 1),
                                    child:Text('Order Now',style: TextStyle(
                                      fontSize: 15 ,
                                      fontWeight:FontWeight.bold,
                                      letterSpacing: 2.0,

                                    ),)
                                ),
                                onPressed: (){



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
            ),


          ],
        ),
      ),
      backgroundColor: Colors.brown[200],
      body:_drawCartList() ,



    );
  }
  String _value ='';
  FirebaseAuthentication firebaseAuthentication = FirebaseAuthentication();
  String useruid() => firebaseAuthentication.getuid();
  CollectionReference cart = FirebaseFirestore.instance.collection('cart');
  Widget _drawCartList(){

    return  StreamBuilder<QuerySnapshot>(
      stream: cart.where('uid' ,isEqualTo: useruid() ).snapshots(),
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
                          color: Colors.white70,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.brown,
                              blurRadius: 5.0,
                              spreadRadius: 5.0,
                              offset: Offset(5.0, 5.0), // shadow direction: bottom right
                            )
                          ],
                        ),

                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Column(
                            children:[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.brown.shade800,
                                    child: const Text('PIC'),


                                  ),

                                  Text("${snapshot.data!.docs[i].get('title')}" ,
                                      style: TextStyle(
                                        fontSize: 22 ,
                                        fontWeight:FontWeight.bold,
                                        letterSpacing: 3.0,

                                      )),



                                  IconButton(

                                      onPressed: (){
                                        String id =snapshot.data!.docs[i].id;
                                        cart.doc(id).delete();
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

                                ],
                              ),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Price :${snapshot.data!.docs[i].get('price') +'-DT-'}" ,
                                      style: TextStyle(
                                        fontSize: 15 ,
                                        fontWeight:FontWeight.bold,
                                        letterSpacing: 3.0,

                                      )),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          int x = snapshot.data!.docs[i].get('quan');
                                          x++;

                                          String id =snapshot.data!.docs[i].id;
                                          cart.doc(id).update({ 'quan' : x } );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          primary: const Color(0xffA3DD45),
                                          minimumSize: const Size(16, 16),
                                        ),
                                        child: const Icon(Icons.add_circle_outline),
                                      ),


                                      Text("${snapshot.data!.docs[i].get('quan').toString() }" ,
                                          style: TextStyle(
                                            fontSize: 15 ,
                                            fontWeight:FontWeight.bold,
                                            letterSpacing: 3.0,

                                          )),

                                      ElevatedButton(
                                        onPressed: () {

                                          int x = snapshot.data!.docs[i].get('quan');
                                          if(x>1)
                                            x--;

                                          String id =snapshot.data!.docs[i].id;
                                          cart.doc(id).update({ 'quan' : x } );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          primary: const Color(0xffc62828),
                                          minimumSize: const Size(16, 16),
                                        ),
                                        child: const Icon(Icons.remove_circle_outline),
                                      ),
                                    ],
                                  ),









                                ],

                              ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(" Totale Price :" ,
                                     style: TextStyle(
                                       fontSize: 15 ,
                                       fontWeight:FontWeight.bold,
                                       letterSpacing: 3.0,

                                     )),
                                 Text(calc(snapshot.data!.docs[i].get('quan'), snapshot.data!.docs[i].get('price')   ),
                                     style: TextStyle(
                                       color: Colors.brown,
                                       fontSize: 15 ,
                                       fontWeight:FontWeight.bold,
                                       letterSpacing: 3.0,

                                     )
                                 )
                               ],
                             ),
                             // CalcTotale(snapshot.data!.docs[i].get('quan'), snapshot.data!.docs[i].get('price')),
                              //Text(TotaleCart.toString()),







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
  calc (int quan , String price ){

   var  p = int.parse(price);
   var q= quan ;
   var totale = p*q ;

   return totale.toString() + '-DT-' ;
  }
  calcT (int quan , String price ){

    var  p = int.parse(price);
    var q= quan ;
    var totale = p*q ;
    TotaleCart = TotaleCart+totale;
    print(TotaleCart);
    return totale.toString() + '-DT-' ;
  }

int TotaleCart = 0 ;



}

