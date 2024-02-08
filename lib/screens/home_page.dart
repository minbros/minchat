import 'package:flutter/material.dart';
import 'login_page.dart';
import 'sign_up_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenRatio = screenHeight / screenWidth;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // 키보드 같은 거 불러왔을 때 화면 조정이 안되게끔 함
      // 화면 조정이 될 경우,
      // bottom에 정렬된 위젯이 키보드 위로 올라와서 위젯이 겹쳐버려서 에러가 발생하게 됨
      body: Container(
        padding: EdgeInsets.fromLTRB(
          (screenRatio >= 2) ? screenWidth * 0.1 : screenWidth * 0.15,
          screenHeight * 0.3,
          (screenRatio >= 2) ? screenWidth * 0.1 : screenWidth * 0.15,
          screenHeight * 0.06,
        ),
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
              Icon(
                Icons.emoji_emotions,
                size: screenHeight * 0.115,   // pixel 7 기준 100
                color: Colors.white70,
              ),
              Text(
                'MIN CHAT',
                style: TextStyle(
                    fontSize: screenHeight * 0.035,   // pixel 7 기준 30
                    letterSpacing: 0.5,
                    wordSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                    fontFamily: 'Gilroy'),
              ),
              SizedBox(
                height: screenHeight * 0.08,
              ),
              SizedBox(
                width: double.infinity,
                // 상위 컨테이너에서 padding을 해줬기 때문에 가로로 끝까지 늘리기만 하면 됨
                height: screenHeight * 0.052,   // pixel 7 기준 45
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: screenHeight * 0.016,
                      color: Colors.black87,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,   // pixel 7 기준 10
              ),
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.052,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: const BorderSide(color: Colors.white, width: 1),
                  ),
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: screenHeight * 0.016,
                      color: Colors.white,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {}, // '게스트로 계속' 구현 필요
                    child: Text(
                      'Continue to as a guest',
                      style: TextStyle(
                        fontSize: screenHeight * 0.016,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white70,
                        decorationStyle: TextDecorationStyle.dotted,
                        decorationThickness: 1.5,
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
