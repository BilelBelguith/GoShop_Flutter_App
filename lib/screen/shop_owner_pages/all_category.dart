


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectpfe/screen/shop_owner_pages/update_form.dart';



class AllCategory extends StatefulWidget {
  const AllCategory({Key? key}) : super(key: key);

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {

  TextEditingController _updater = TextEditingController();

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
                  return  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            showDialog(

                                context: context,
                                builder: (context) {
                                  return AlertDialog(

                                    backgroundColor: Colors.brown[200],
                                    elevation: 20,
                                    title: Center(child :
                                    Text("UPDATE CATEGORY",
                                        style: TextStyle(
                                          fontSize: 22 ,
                                          fontWeight:FontWeight.bold,
                                          letterSpacing: 2.0,)
                                    ),
                                    ),
                                    content: TextFormField(
                                      cursorColor: Colors.brown,
                                      decoration: InputDecoration(

                                        labelText:"${snapshot.data!.docs[i].get('title')}" ,
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
                                      controller: _updater,
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
                                            Category.doc(id).update({ 'title' : _updater.text });
                                            _updater.clear();

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