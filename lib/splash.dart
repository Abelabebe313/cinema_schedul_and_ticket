import 'package:cinema_schedule_/screens/login_register_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cinema_schedule_/bottom_nav.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    checkFirstVisit();
  }

  Future<void> checkFirstVisit() async {
    final prefs = await SharedPreferences.getInstance();
    final visitedBefore = prefs.getBool('visited_before') ?? false;

    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (visitedBefore) {
          // If visited before, navigate to Home()
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        } else {
          // If first visit, navigate to OnBoardingScreen()
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );

          // Set visited_before flag to true for future visits
          prefs.setBool('visited_before', true);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B1E25),
      body: Container(
        decoration: const BoxDecoration(color: Color(0xff1B1E25)),
        child: Center(
          child: Container(
            width: 450,
            height: 200,
            margin: const EdgeInsets.only(bottom: 50),
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
      ),
    );
  }
}
