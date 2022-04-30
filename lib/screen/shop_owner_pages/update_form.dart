import 'package:flutter/material.dart';

class UpdateCategory extends StatefulWidget {
  String value ;
  UpdateCategory({required this.value});

  @override
  State<UpdateCategory> createState() => _UpdateCategoryState();
}

class _UpdateCategoryState extends State<UpdateCategory> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              child :Text('Update Category' ,
                style: TextStyle(
                  fontSize: 22 ,
                  fontWeight:FontWeight.bold,
                  letterSpacing: 3.0,

                ),
              ),
            )
        ),

        body: _categoryForm()




    );
  }

  Widget _categoryForm(){

    return  Container(
      padding: EdgeInsets.only(left: 35 , right: 35),
      child: Center(
        child: Form(
            //key: _formKey ,
            child: Column(
              children: [
                SizedBox(height: 80),
                TextFormField(
                  //controller: _categoryTitleController,
                  cursorColor: Colors.brown,

                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.title,
                      color: Colors.brown,
                    ),
                    labelText: 'New Title' ,
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
                      child:Text('Update Category',
                        style: TextStyle(
                          fontSize: 15 ,
                          fontWeight:FontWeight.bold,
                          letterSpacing: 2.0,

                        ),)
                  ),
                  onPressed: (){},
                ),


              ],
            )
        ),
      ),
    );
  }
}
