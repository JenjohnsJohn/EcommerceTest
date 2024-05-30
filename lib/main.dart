import 'package:ecommerce/utils.dart';
import 'package:ecommerce/view/cart_screen.dart';
import 'package:ecommerce/view/home_screen.dart';
import 'package:ecommerce/view/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';



void main() async {
  await registerServices();
  await registerControllers();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.rubikTextTheme(),
      ),
      routes: {
        "/home": (context) => HomeScreen(),
        "/cart": (context) => CartScreen(),
      },
      initialRoute: "/home",
    );
  }
}
