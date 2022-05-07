
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projectpfe/screen/shop_owner_pages/add_category.dart';
import 'package:projectpfe/screen/shop_owner_pages/add_product.dart';
import 'package:projectpfe/screen/shop_owner_pages/all_category.dart';
import 'package:projectpfe/screen/shop_owner_pages/all_product.dart';
import 'package:projectpfe/screen/shop_owner_pages/orders_page.dart';
import 'package:projectpfe/screen/shop_owner_pages/profile.dart';




class HomePageShopOwner extends StatefulWidget {
  const HomePageShopOwner({Key? key}) : super(key: key);

  @override
  State<HomePageShopOwner> createState() => _HomePageShopOwnerState();
}

class _HomePageShopOwnerState extends State<HomePageShopOwner> {
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
            child :Text('GOSHOP' ,
              style: TextStyle(
                fontSize: 22 ,
                fontWeight:FontWeight.bold,
                letterSpacing: 3.0,

              ),),
          )
      ),
      drawer: NavigationDrawer() ,
      
      body: Center(child : Text('Use Drawer For More Activities')),
    ));
  }
}

class NavigationDrawer extends StatelessWidget {

  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
          borderRadius:  BorderRadius.only(
            bottomRight: Radius.circular(70),
            topLeft: Radius.circular(70),
          )
      ),
      child:  Material(
        color: Colors.brown,
        child: ListView(
          padding: padding,
          children: [
            const SizedBox(height: 40),
            buildMenuItem(
              text : 'Profile',
              icon : Icons.people ,
              onClicked: ()=> selectedItem(context , 0),
            ),

            const SizedBox(height: 60),
            buildMenuItem(
              text : 'Add Categories',
              icon : Icons.library_add_sharp ,
              onClicked: ()=> selectedItem(context , 1),
            ),
            const SizedBox(height: 15),
            buildMenuItem(
              text : 'Add Products',
              icon : Icons.library_add_sharp ,
              onClicked: ()=> selectedItem(context , 2),
            ),
            const SizedBox(height: 15),
            buildMenuItem(
              text : 'All Categories',
              icon : Icons.library_books_rounded ,
              onClicked: ()=> selectedItem(context , 3),
            ),
            const SizedBox(height: 15),
            buildMenuItem(
              text : 'All Products',
              icon : Icons.library_books_rounded ,
              onClicked: ()=> selectedItem(context , 4),
            ),
            const SizedBox(height: 15),
            buildMenuItem(
              text : 'Orders',
              icon : Icons.account_balance_wallet_rounded,
              onClicked: ()=> selectedItem(context , 5),
            ),
            const SizedBox(height: 60),
            buildMenuItem(
              text : 'Customer Mode',
              icon : Icons.swap_horiz,
              onClicked: ()=> selectedItem(context , 6),
            ),

          ],
        ),
      ),
    );
  }
  Widget buildMenuItem({
    required String text ,
    required IconData icon ,
    VoidCallback? onClicked ,
  })
  {
    final color = Colors.white ;
    final hoverColor = Colors.brown[200];
    return ListTile(
      leading: Icon(icon , color: color),
      title: Text(text , style: TextStyle(
        color: color ,
        letterSpacing: 2.0,
        fontSize: 15 ,

      )),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context , int index){
    switch (index){
      case 0 :
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProfileOwner()));
        break ;
      case 1 :
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddCategory()));
        break ;
      case 2 :
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddProduct()));
        break ;
      case 3 :
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AllCategory()));
        break ;
      case 4 :
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AllProduct()));
        break ;

      case 5 :
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> OrderList()));
        break ;

    }
  }

}




