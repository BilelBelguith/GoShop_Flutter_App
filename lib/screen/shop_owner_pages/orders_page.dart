import 'package:flutter/material.dart';


class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
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
            child :Text('Orders' ,
              style: TextStyle(
                fontSize: 22 ,
                fontWeight:FontWeight.bold,
                letterSpacing: 3.0,

              ),),
          )
      ),
      body: Center(child : Text('menu')),
    ));
  }
}
