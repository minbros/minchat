import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:minchat/screens/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isVisible = false;

  // .dispose()는 리소스 해제 및 클린업 작업을 담당하는 메소드
  // 이걸 해줘야 포커스가 하나에만 잡힐 수 있음

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(
            screenWidth * 0.1,
            screenHeight * 0.17,
            screenWidth * 0.1,
            screenHeight * 0.06,
          ),
          // 배경 그라데이션
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
                // Welcome,
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontFamily: 'Geo',
                    fontWeight: FontWeight.bold,
                    fontSize: 33,
                    color: Colors.white,
                  ),
                ),
                // Glad to see you!
                const Text(
                  'to get started now!',
                  style: TextStyle(
                    fontFamily: 'Geo',
                    fontSize: 33,
                    letterSpacing: -0.5,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.024,
                ),
                SizedBox(
                  child: Form(
                    child: Column(
                      children: [
                        // 이메일 입력란
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              // enabledBorder는 활성화 상태일 때의 경계선을 설정함
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              // focusedBorder는 해당 텍스트폼에 텍스트를 입력하는 상태일 때의 경계선을 설정함
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            hintText: 'Email Address',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                              fontFamily: 'Geo',
                              fontWeight: FontWeight.bold,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            filled: true,
                            fillColor: Colors.white12,
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'Geo',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // 비밀번호 입력란
                        TextFormField(
                          obscureText: _isVisible ? false : true,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              // enabledBorder는 활성화 상태일 때의 경계선을 설정함
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              // focusedBorder는 해당 텍스트폼에 텍스트를 입력하는 상태일 때의 경계선을 설정함
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                              fontFamily: 'Geo',
                              fontWeight: FontWeight.bold,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            filled: true,
                            fillColor: Colors.white12,
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isVisible = !_isVisible;
                                });
                              },
                              icon: Icon(
                                _isVisible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                              ),
                              color: Colors.white70,
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'Geo',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: _isVisible ? false : true,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              // enabledBorder는 활성화 상태일 때의 경계선을 설정함
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              // focusedBorder는 해당 텍스트폼에 텍스트를 입력하는 상태일 때의 경계선을 설정함
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            hintText: 'Confirm Password',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                              fontFamily: 'Geo',
                              fontWeight: FontWeight.bold,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            filled: true,
                            fillColor: Colors.white12,
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isVisible = !_isVisible;
                                });
                              },
                              icon: Icon(
                                _isVisible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                              ),
                              color: Colors.white70,
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'Geo',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.035,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {}, // 회원 가입 이후 구현 필요
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.092,
                ),
                const Divider(
                  color: Colors.white70,
                ),
                SizedBox(
                  height: screenHeight * 0.024,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.385,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {}, // 구글로 로그인 기능 구현 필요
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          child: Image.asset('assets/login_google.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.03,
                    ),
                    SizedBox(
                      width: screenWidth * 0.385,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {}, // 페이스북으로 로그인 기능 구현 필요
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          child: Image.asset('assets/login_facebook.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Geo',
                          color: Colors.black87,
                        ),
                        children: [
                          TextSpan(
                            text: 'Login Now',
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Geo',
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.dotted,
                              decorationColor: Colors.white70,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
