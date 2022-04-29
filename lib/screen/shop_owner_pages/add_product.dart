import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  bool isLoding = false ;



  @override
  void dispose(){
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();


    super.dispose();
  }
  CollectionReference products = FirebaseFirestore.instance.collection('Products');

    Future<void> addProduct() {
    // Call the user's CollectionReference to add a new user
    return products
        .add({
      'title': _titleController.text,
      'description': _descriptionController.text,
      'price': _priceController.text ,
    })
        .then((value) => print("Product Added"))
        .catchError((error) => print("Failed to add product: $error"));
  }


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
            child :Text('Add New Product' ,
              style: TextStyle(
                fontSize: 22 ,
                fontWeight:FontWeight.bold,
                letterSpacing: 3.0,

              ),),
          )
      ),


        body: (isLoding)? _loding() :_productForm()
    )
    );
  }

  Widget _loding(){
    return Container(
      color: Colors.brown[200],
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.brown,
        ),
      ) ,
    );
  }


 Widget _productForm(){
      return  SingleChildScrollView(child : Container(
        padding: EdgeInsets.only(left: 35 , right: 35),
        child:Center(
          child: Form(
            key: _formKey ,
            child: Column(

              children: [
                SizedBox(height: 15),
                TextFormField(
                  controller: _titleController,
                  cursorColor: Colors.brown,

                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.title,
                      color: Colors.brown,
                    ),
                    labelText: 'Product Title',
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
                      return 'Title is required';
                    }
                    return null;
                  },


                ),
                SizedBox(height: 15),

                TextFormField(
                  controller: _descriptionController,
                  maxLines: 3,
                  cursorColor: Colors.brown,

                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.description,
                      color: Colors.brown,
                    ),
                    labelText: 'Product Description',
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
                      return 'Description is required';
                    }
                    return null;
                  },


                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: _priceController,
                  cursorColor: Colors.brown,

                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.brown,
                    ),
                    labelText: 'Product Price',
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
                      return 'Price is required';
                    }
                    return null;
                  },


                ),
                SizedBox(height: 30,),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown,

                  ),
                  child: Container(
                      padding: EdgeInsets.fromLTRB(26, 1, 26, 1),
                      child:Text('Save Product',
                        style: TextStyle(
                          fontSize: 15 ,
                          fontWeight:FontWeight.bold,
                          letterSpacing: 2.0,

                        ),)
                  ),
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      setState((){
                        isLoding = true ;
                      });

                      addProduct().then((value) => setState((){
                        isLoding = false ;
                      })).then((value) =>   showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(

                              backgroundColor: Colors.brown[200],
                              elevation: 20,
                              title: Center(child :
                              Text("Product Added",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight:FontWeight.bold,
                                    letterSpacing: 2.0,)
                              ),
                              ),


                            );
                          }
                      ));
                      _formKey.currentState!.reset();
                      _priceController.clear();
                      _descriptionController.clear();
                      _titleController.clear();
                    }
                  },
                ),

              ],
            ),
          ),
        ),
      )
      );
 }
}
