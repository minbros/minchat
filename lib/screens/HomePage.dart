import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'SignUpPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(top: 250, bottom: 50),
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
              const Icon(
                Icons.emoji_emotions,
                size: 100,
                color: Colors.white70,
              ),
              const Text(
                'MIN CHAT',
                style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 0.5,
                    wordSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                    fontFamily: 'Gilroy'),
              ),
              const SizedBox(
                height: 70,
              ),
              SizedBox(
                width: screenWidth * 0.8,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
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
                width: screenWidth * 0.8,
                height: 45,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpPage()),
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
              // const SizedBox(
              //   height: 250,
              // ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {}, // '게스트로 계속' 구현 필요
                    child: const Text(
                      'Continue to as a guest',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white70,
                        decorationStyle: TextDecorationStyle.dotted,
                        color: Colors.white,
                        fontFamily: 'Geo',
                      ),
                    ),
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
