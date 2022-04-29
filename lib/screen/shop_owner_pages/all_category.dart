import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class AllCategory extends StatefulWidget {
  const AllCategory({Key? key}) : super(key: key);

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {

  CollectionReference products = FirebaseFirestore.instance.collection('Categories');


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
              child :Text('All Categories' ,
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
      stream: FirebaseFirestore.instance.collection('Categories').snapshots(),
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
                  return  ListTile(
                    title: new Text("${snapshot.data!.docs[i].get('title')}"),

                  );
                });


        }
      },
    );
  }


}
