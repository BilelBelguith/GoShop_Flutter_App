import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoding = false ;

  TextEditingController _categoryTitleController = TextEditingController();

  @override
  void dispose(){
    _categoryTitleController.dispose();


    super.dispose();
  }


  CollectionReference category = FirebaseFirestore.instance.collection('Categories');

  Future<void> addCategory() {
    // Call the user's CollectionReference to add a new user
    return category
        .add({
      'title': _categoryTitleController.text,

    }).then((value) => print("Category Added"))
        .catchError((error) => print("Failed to add Category: $error"));

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
                child :Text('Add New Category' ,
                style: TextStyle(
                fontSize: 22 ,
                fontWeight:FontWeight.bold,
                letterSpacing: 3.0,

        ),
                ),
        )
        ),

      body: (isLoding)? _loding() :_categoryForm()




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

  Widget _categoryForm(){
    return  Container(
      padding: EdgeInsets.only(left: 35 , right: 35),
      child: Center(
        child: Form(
            key: _formKey ,
            child: Column(
              children: [
                SizedBox(height: 80),
                TextFormField(
                  controller: _categoryTitleController,
                  cursorColor: Colors.brown,

                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.title,
                      color: Colors.brown,
                    ),
                    labelText: 'Category Title',
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
                      return 'Category Title is required';
                    }
                    return null;
                  },


                ),


                SizedBox(height: 80,),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown,

                  ),
                  child: Container(
                      padding: EdgeInsets.fromLTRB(26, 1, 26, 1),
                      child:Text('Save Category',
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
                      addCategory().then((value) => setState((){
                        isLoding = false ;
                      })).then((value) =>   showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(

                              backgroundColor: Colors.brown[200],
                              elevation: 20,
                              title: Center(child :
                              Text("Category Added",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight:FontWeight.bold,
                                    letterSpacing: 2.0,)
                              ),
                              ),


                            );
                          }
                      ));;
                      _formKey.currentState!.reset();
                      _categoryTitleController.clear();

                    }

                  },
                ),


              ],
            )
        ),
      ),
    );
  }
}
