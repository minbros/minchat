import 'package:flutter/material.dart';
import 'package:minchat/LoginPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(201, 161, 255, 1),
              Color.fromRGBO(140, 173, 255, 1),
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 220),
                child: const Icon(
                  Icons.people,
                  size: 150,
                  color: Colors.white70,
                ),
              ),
              const Text(
                'MIN CHAT',
                style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 2,
                    wordSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                    fontFamily: 'Gilroy'),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: screenWidth * 0.75,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: screenWidth * 0.75,
                height: 45,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: const BorderSide(color: Colors.white, width: 1),
                  ),
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 260,
              ),
              GestureDetector(
                onTap: () {}, // '게스트로 계속' 구현 필요
                child: const Text(
                  'Continue to as a guest',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white70,
                    decorationThickness: 2.0,
                    decorationStyle: TextDecorationStyle.dotted,
                    color: Colors.white,
                    fontFamily: 'Geo',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
