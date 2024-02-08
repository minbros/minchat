import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:minchat/screens/login_page.dart';
import 'package:minchat/config/validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  bool _isVisible = false;
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenRatio = screenHeight / screenWidth;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(
            (screenRatio >= 2) ? screenWidth * 0.1 : screenWidth * 0.15,
            screenHeight * 0.17,
            (screenRatio >= 2) ? screenWidth * 0.1 : screenWidth * 0.15,
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
                Text(
                  'Create Account',
                  style: TextStyle(
                    fontFamily: 'Geo',
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.038,
                    color: Colors.white,
                  ),
                ),
                // Glad to see you!
                Text(
                  'to get started now!',
                  style: TextStyle(
                    fontFamily: 'Geo',
                    fontSize: screenHeight * 0.038,
                    letterSpacing: -0.5,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.024,
                ),
                Form(
                  key: _formKey,
                  autovalidateMode:
                      _autoValidate ? AutovalidateMode.onUserInteraction : null,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // 이메일 입력란
                        TextFormField(
                          validator: (value) {
                            return validateEmail(value);
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              // enabledBorder는 활성화 상태일 때의 경계선을 설정함
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(screenHeight * 0.012)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              // focusedBorder는 해당 텍스트폼에 텍스트를 입력하는 상태일 때의 경계선을 설정함
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(screenHeight * 0.012)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(screenHeight * 0.012)),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(screenHeight * 0.012)),
                            ),
                            errorStyle: const TextStyle(
                              fontFamily: 'Geo',
                            ),
                            hintText: 'Email Address',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                              fontFamily: 'Geo',
                              fontWeight: FontWeight.bold,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.035,
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
                        SizedBox(height: screenHeight * 0.012),
                        // 비밀번호 입력란
                        TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            return validatePassword(value);
                          },
                          obscureText: _isVisible ? false : true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(screenHeight * 0.012)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(screenHeight * 0.012)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(screenHeight * 0.012)),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(screenHeight * 0.012)),
                            ),
                            errorStyle: const TextStyle(
                              fontFamily: 'Geo',
                            ),
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                              fontFamily: 'Geo',
                              fontWeight: FontWeight.bold,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.035,
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
                        SizedBox(height: screenHeight * 0.012),
                        TextFormField(
                          validator: (value) {
                            return validateConfirm(value, _passwordController);
                          },
                          obscureText: _isVisible ? false : true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              // enabledBorder는 활성화 상태일 때의 경계선을 설정함
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(screenHeight * 0.012)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              // focusedBorder는 해당 텍스트폼에 텍스트를 입력하는 상태일 때의 경계선을 설정함
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(screenHeight * 0.012)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(screenHeight * 0.012)),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(screenHeight * 0.012)),
                            ),
                            errorStyle: const TextStyle(
                              fontFamily: 'Geo',
                            ),
                            hintText: 'Confirm Password',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                              fontFamily: 'Geo',
                              fontWeight: FontWeight.bold,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.035,
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
                SizedBox(height: screenHeight * 0.035),
                SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.054,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                      } else {
                        setState(() {
                          _autoValidate = true;
                        });
                      }
                    }, // 회원 가입 이후 구현 필요
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(screenHeight * 0.012),
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
                SizedBox(height: screenHeight * 0.092),
                const Divider(
                  color: Colors.white70,
                ),
                SizedBox(height: screenHeight * 0.024),
                Row(
                  children: [
                    SizedBox(
                      width: (screenRatio >= 2)
                          ? screenWidth * 0.385
                          : screenWidth * 0.337,
                      height: screenHeight * 0.054,
                      child: ElevatedButton(
                        onPressed: () {}, // 구글로 로그인 기능 구현 필요
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(screenHeight * 0.012),
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(screenHeight * 0.006),
                          child: Image.asset('assets/login_google.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: (screenRatio >= 2)
                          ? screenWidth * 0.03
                          : screenWidth * 0.026,
                    ),
                    SizedBox(
                      width: (screenRatio >= 2)
                          ? screenWidth * 0.385
                          : screenWidth * 0.337,
                      height: screenHeight * 0.054,
                      child: ElevatedButton(
                        onPressed: () {}, // 페이스북으로 로그인 기능 구현 필요
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(screenHeight * 0.012),
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(screenHeight * 0.006),
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
                        style: TextStyle(
                          fontSize: screenHeight * 0.016,
                          fontFamily: 'Geo',
                          color: Colors.black87,
                        ),
                        children: [
                          TextSpan(
                            text: 'Login Now',
                            style: TextStyle(
                              fontSize: screenHeight * 0.016,
                              fontFamily: 'Geo',
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.dotted,
                              decorationColor: Colors.white70,
                              decorationThickness: 1.5,
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
