import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class AllProduct extends StatefulWidget {
  const AllProduct({Key? key}) : super(key: key);

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {

  CollectionReference products = FirebaseFirestore.instance.collection('Products');


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
            child :Text('All Products' ,
              style: TextStyle(
                fontSize: 22 ,
                fontWeight:FontWeight.bold,
                letterSpacing: 3.0,

              ),),
          )
      ),
      body:  _drawProducts()

    )
    );
  }

  Widget _drawProducts(){

    return  StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Products').snapshots(),
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
                            return Column(
                              children: [
                                Text("${snapshot.data!.docs[i].get('title')}"),
                                Text("${snapshot.data!.docs[i].get('description')}"),
                                Text("${snapshot.data!.docs[i].get('price')}"),


                              ],
                            );

                            //   ListTile(
                            //   title: new Text("${snapshot.data!.docs[i].get('title')}"),
                            //   subtitle: new Text("${snapshot.data!.docs[i].get('price' )}"),
                            // );
                            });


          }
        },
    );
  }


}
