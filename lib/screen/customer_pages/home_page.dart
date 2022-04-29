

import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:projectpfe/screen/customer_pages/cart.dart';
import 'package:projectpfe/screen/customer_pages/in_home.dart';
import 'package:projectpfe/screen/customer_pages/profile.dart';
import 'package:projectpfe/screen/customer_pages/watch_list.dart';



class HomePageCustomer extends StatefulWidget {
  const HomePageCustomer({Key? key}) : super(key: key);

  @override
  State<HomePageCustomer> createState() => _HomePageCustomerState();
}

class _HomePageCustomerState extends State<HomePageCustomer> {
  int currentIndex =0 ;
  final screens = [
    InHome(),
    WatchList(),
    Cart(),
    Profile()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[200],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:  Colors.white,
        unselectedItemColor: Colors.brown[200],
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),

        items: [
          BottomNavigationBarItem(
              icon:Icon(Icons.home) ,
            label: 'Home' ,
             backgroundColor: Colors.brown,
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.favorite) ,
            label: 'Favorite' ,
            backgroundColor: Colors.brown,
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.shopping_cart) ,
            label: 'Cart' ,
            backgroundColor: Colors.brown,
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.people) ,
            label: 'Profile' ,
            backgroundColor: Colors.brown,
          ),
        ],
      ),



      body: screens[currentIndex],

    );
  }
}
