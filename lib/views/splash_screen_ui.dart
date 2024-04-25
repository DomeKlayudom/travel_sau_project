import 'package:flutter/material.dart';
import 'package:travel_sau_project/views/login_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _splashScreenUiState();
}

class _splashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    Future.delayed(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginUI())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.045,
            ),
            Text(
              'บันทึกการเดินทาง',
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.045,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.045,
            ),
            CircularProgressIndicator(
              color: Colors.grey[800],
            ),
            Text(
              'Created by : 6552410028',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: MediaQuery.of(context).size.height * 0.045,
              ),
            ),
            Text(
              'Dome Klayudom',
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.045,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
