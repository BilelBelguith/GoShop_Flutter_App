


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectpfe/screen/shop_owner_pages/update_form.dart';



class AllCategory extends StatefulWidget {
  const AllCategory({Key? key}) : super(key: key);

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {

  CollectionReference Category = FirebaseFirestore.instance.collection('Categories');
  TextEditingController _valueUpdate = TextEditingController();


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
      stream: Category.snapshots(),
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
                  return  Row(
                    children: [


                      Container(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),

                      child :Text("${snapshot.data!.docs[i].get('title')}" ,
                          style: TextStyle(
                            fontSize: 22 ,
                            fontWeight:FontWeight.bold,
                            letterSpacing: 3.0,

                          ))
                      ),
                      SizedBox(width: 80),
                      IconButton(

                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> UpdateCategory(value: '',)));

                          },
                          icon: Icon(Icons.update ,
                            color: Colors.green,

                          )
                      ),
                      SizedBox(width: 10),

                      IconButton(

                          onPressed: (){
                            String id =snapshot.data!.docs[i].id;
                            Category.doc(id).delete();
                          },
                          icon: Icon(Icons.delete ,
                              color: Colors.red,
                          size: 30,
                          )
                      )
                    ],
                  );
                });


        }
      },
    );
  }

  }