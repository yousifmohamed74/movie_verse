import 'package:flutter/material.dart';
import 'package:movie_verse/features/home%20screen/ui/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();    
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(),), 
        (route) => false,        
      );
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 15,
            children: [
              Image.asset(
                "assets/images/sp4.png",
                width: 150,
                height: 160,
              ),
              Text("Movie Verse",style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,                
              ),)
            ],
          ),
        ),
      ),
    );
  }
}