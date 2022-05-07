import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class AllProduct extends StatefulWidget {
  const AllProduct({Key? key}) : super(key: key);

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  String dropdownValue = 'categ 1' ;

  selectCategory() {
    return StreamBuilder(
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
                ),
              );
            default :
              return

                Row(
                  children: [
                    SizedBox(width: 10),
                    Text('Pick Category :' , style: TextStyle(
                      fontSize: 17,
                      color: Colors.brown,
                      fontWeight:FontWeight.bold,
                      letterSpacing: 2.0,
                    ),),

                    SizedBox(width: 35),
                    DropdownButton<String>(
                      hint: Text('Category 1'),
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward  , color: Colors.brown),
                      elevation: 16,
                      style: const TextStyle(color: Colors.brown , fontSize: 21 ),
                      underline: Container(
                        height: 3,
                        color: Colors.brown,
                      ),

                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },



                      items: snapshot.data!.docs.map((DocumentSnapshot document)
                      {
                        return DropdownMenuItem<String>(
                          value: document['title'],
                          child: Text(document['title']),
                        );
                      }).toList(),

                    )
                  ],
                );
          }
        }
    );
  }



  late  List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
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
      body:
          _drawProducts(),
          // selectCategory(),



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
                    return Container(
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


                        // margin: EdgeInsets.all(15),
                        // color: Colors.brown,

                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [





                        buildCard(
                        snapshot.data!.docs[i].get('title'),
                        snapshot.data!.docs[i].get('description'),
                        snapshot.data!.docs[i].get('categories'),
                        snapshot.data!.docs[i].get('price'),
                        snapshot.data!.docs[i].get('tags'),
                            snapshot.data!.docs[i].get('quantity'),
                        imgList[i]),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                IconButton(onPressed: (){},
                                  icon: Icon( Icons.update , ),
                                  color: Colors.green,
                                ),
                                IconButton(onPressed: (){
                                  String id =snapshot.data!.docs[i].id;
                                  products.doc(id).delete();
                                },
                                  icon: Icon( Icons.delete , ),
                                  color: Colors.red,

                                ),
                              ],
                            ),


                          ],
                        ),
                    );



                      //buildCard(snapshot.data!.docs[i].get('title'), snapshot.data!.docs[i].get('description'), snapshot.data!.docs[i].get('categories'), snapshot.data!.docs[i].get('price'), 'a');


                            // return Container(
                            //
                            //   padding :EdgeInsets.fromLTRB(30, 10, 30, 10),
                            //   child: Column(
                            //     children: [
                            //
                            //
                            //       Row(
                            //           mainAxisAlignment: MainAxisAlignment.center,
                            //           children: [
                            //
                            //             Text("${snapshot.data!.docs[i].get('title')}",style: TextStyle(
                            //               color: Colors.brown,
                            //               fontSize: 22 ,
                            //               fontWeight:FontWeight.bold,
                            //               letterSpacing: 3.0,
                            //
                            //             ),),
                            //
                            //
                            //             SizedBox(width: 40,),
                            //             IconButton(onPressed: (){},
                            //               icon: Icon( Icons.update , ),
                            //               color: Colors.green,
                            //             ),
                            //             IconButton(onPressed: (){
                            //               String id =snapshot.data!.docs[i].id;
                            //               products.doc(id).delete();
                            //             },
                            //               icon: Icon( Icons.delete , ),
                            //               color: Colors.red,
                            //
                            //             ),
                            //           ]
                            //       ),
                            //       Row(
                            //         mainAxisAlignment: MainAxisAlignment.center,
                            //         children: [
                            //           Text('Category : ' , style: TextStyle(
                            //             color: Colors.brown,
                            //             fontSize: 15 ,
                            //             fontWeight:FontWeight.bold,
                            //             letterSpacing: 3.0,
                            //
                            //           ),),
                            //           Text("${snapshot.data!.docs[i].get('categories')}",style: TextStyle(
                            //             color: Colors.black,
                            //             fontSize: 15 ,
                            //
                            //
                            //
                            //
                            //           ),),
                            //         ],
                            //       ),
                            //
                            //       Container(
                            //
                            //         // decoration: BoxDecoration(
                            //         //
                            //         //     borderRadius: BorderRadius.all(Radius.circular(20)),
                            //         //     border: Border.all(color: Colors.brown , width: 3)
                            //         // ),
                            //         margin: EdgeInsets.all(5.0),
                            //         child : ClipRRect(
                            //
                            //           borderRadius: BorderRadius.all(Radius.circular(20)),
                            //           child: CarouselSlider(
                            //             options: CarouselOptions(
                            //               aspectRatio: 2.0,
                            //               enlargeCenterPage: true,
                            //               enableInfiniteScroll: false,
                            //               initialPage: 2,
                            //               autoPlay: true,
                            //             ),
                            //             items: imgList
                            //                 .map((item) => Container(
                            //               child: Container(
                            //                   decoration: BoxDecoration(
                            //
                            //                       //borderRadius: BorderRadius.all(Radius.circular(20)),
                            //                       border: Border.all(color: Colors.brown , width: 3)
                            //                   ),
                            //                   child:
                            //                   Image.network(item, fit: BoxFit.cover, width: 1000)),
                            //             ))
                            //                 .toList(),
                            //           ),
                            //         ),
                            //       ),
                            //       Container(
                            //           padding :EdgeInsets.all(5),
                            //
                            //           decoration: BoxDecoration(
                            //
                            //               borderRadius: BorderRadius.all(Radius.circular(20)),
                            //               border: Border.all(color: Colors.brown , width: 2)
                            //           ),
                            //           margin: EdgeInsets.all(5.0),
                            //           child : Column(
                            //             children: [
                            //               Text('Description : ' , style: TextStyle(
                            //                 color: Colors.brown,
                            //                 fontSize: 15 ,
                            //                 fontWeight:FontWeight.bold,
                            //                 letterSpacing: 3.0,
                            //
                            //               ),),
                            //               Text("${snapshot.data!.docs[i].get('description')}",style: TextStyle(
                            //                 color: Colors.black,
                            //                 fontSize: 15 ,
                            //
                            //
                            //
                            //
                            //               ),),
                            //             ],
                            //           )
                            //       ),
                            //
                            //       Row(
                            //         mainAxisAlignment: MainAxisAlignment.center,
                            //         children: [
                            //           Text('Product Price : ' , style: TextStyle(
                            //             color: Colors.brown,
                            //             fontSize: 15 ,
                            //             fontWeight:FontWeight.bold,
                            //             letterSpacing: 3.0,
                            //
                            //           ),),
                            //           Text("${snapshot.data!.docs[i].get('price')}"+'-DT-' ,style: TextStyle(
                            //             color: Colors.black,
                            //             fontSize: 15 ,
                            //
                            //
                            //
                            //
                            //           ),),
                            //         ],
                            //       ),
                            //
                            //
                            //
                            //
                            //
                            //
                            //
                            //
                            //
                            //
                            //
                            //
                            //     ],
                            //   ),
                            //
                            // );

                            //   ListTile(
                            //   title: new Text("${snapshot.data!.docs[i].get('title')}"),
                            //   subtitle: new Text("${snapshot.data!.docs[i].get('price' )}"),
                            // );
                            });


          }
        },
    );



  }

  Card buildCard(String title , desc , categ , price ,tag, quan ,  pic ) {

    var heading = title;
    var subheading = categ;
    var cardImage = NetworkImage(pic);
    var supportingText =
        desc;
    return Card(
        elevation: 0,
        child: Column(
          children: [
            ListTile(

              title: Center(child:Text(heading , style: TextStyle(
                color: Colors.black,
                fontSize: 22 ,
                fontWeight:FontWeight.bold,
                letterSpacing: 3.0,

              ),
              )
              ),
              subtitle: Text('Category :  '+subheading , style: TextStyle(
                color: Colors.brown,
                fontSize: 15 ,

                fontWeight:FontWeight.bold,


              ),),
            ),
            Container(
              height: 200.0,
              child: Ink.image(
                image: cardImage,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text('Description' , style: TextStyle(
                    color: Colors.brown,
                    fontSize: 15 ,
                    fontWeight:FontWeight.bold,
                    letterSpacing: 2.0,

                  ),),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15,3, 15, 5),
                  alignment: Alignment.centerLeft,
                  child: Text( supportingText),
                ),


              ],
            ),

            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text('Tags : ' , style: TextStyle(
                    color: Colors.brown,
                    fontSize: 15 ,
                    fontWeight:FontWeight.bold,
                    letterSpacing: 2.0,

                  ),),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15,3, 15, 5),
                  alignment: Alignment.centerLeft,
                  child: Text( tag),
                ),


              ],
            ),

            ButtonBar(
              children: [
                Text('Quantity : ' +quan+' P    -- ' , style: TextStyle(
                  color: Colors.brown,
                  fontSize: 15 ,
                  fontWeight:FontWeight.bold,


                ),),




                Text('Price : ' +price+' DT ' , style: TextStyle(
                  color: Colors.brown,
                  fontSize: 15 ,
                  fontWeight:FontWeight.bold,


                ),)
              ],
            )
          ],
        ));
  }
}
