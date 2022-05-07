import 'package:flutter/material.dart';
import 'package:projectpfe/screen/customer_pages/home_page.dart';
import 'package:projectpfe/screen/register_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:projectpfe/screen/shop_owner_pages/home_page.dart';
import 'package:projectpfe/screen/signin_page.dart';
import 'package:projectpfe/screen/splash_page.dart';
import 'package:projectpfe/screen/welcome_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  //  options: DefaultFirebaseOption
  );
  runApp(const FlutterShop());
}

class FlutterShop extends StatelessWidget {
  const FlutterShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePageCustomer(),
    );
  }
}



