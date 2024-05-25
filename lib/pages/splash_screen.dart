import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/pages/login.dart';
import 'package:shopping_app/shopping_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), routeUser);
    checkUser();
  }

  void routeUser() {
    if (isLoggedIn == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ShoppingApp()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    }
  }

  var isLoggedIn = false;
  Future<void> checkUser() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        isLoggedIn = prefs.getBool('isLoggedIn') as bool;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        'assets/images/splash.png',
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fitHeight,
      )),
    );
  }
}
