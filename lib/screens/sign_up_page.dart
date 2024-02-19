import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:minchat/screens/login_page.dart';
import 'package:minchat/config/validator.dart';
import 'package:minchat/config/palette.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final _authentication = FirebaseAuth.instance;

  bool _isVisible = false;
  bool _autoValidate = false;
  bool _showSpinning = false;

  String _userEmail = '';
  String _userPassword = '';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenRatio = screenHeight / screenWidth;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinning,
        opacity: 0.2,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(
              (screenRatio >= 2) ? screenWidth * 0.1 : screenWidth * 0.15,
              screenHeight * 0.15,
              (screenRatio >= 2) ? screenWidth * 0.1 : screenWidth * 0.15,
              screenHeight * 0.05,
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
                    autovalidateMode: _autoValidate
                        ? AutovalidateMode.onUserInteraction
                        : null,
                    child: Column(
                      children: [
                        // 이메일 입력란
                        TextFormField(
                          validator: validateEmail,
                          onSaved: (value) {
                            _userEmail = value!;
                          },
                          onChanged: (value) {
                            _userEmail = value;
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
                              borderSide:
                                  const BorderSide(color: Palette.errorColor),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(screenHeight * 0.012)),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Palette.errorColor),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(screenHeight * 0.012)),
                            ),
                            errorStyle: const TextStyle(
                              fontFamily: 'Geo',
                              color: Palette.errorColor,
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
                          validator: validatePassword,
                          onSaved: (value) {
                            _userPassword = value!;
                          },
                          onChanged: (value) {
                            _userPassword = value;
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
                              borderSide:
                                  const BorderSide(color: Palette.errorColor),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(screenHeight * 0.012)),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Palette.errorColor),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(screenHeight * 0.012)),
                            ),
                            errorStyle: const TextStyle(
                              fontFamily: 'Geo',
                              color: Palette.errorColor,
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
                              borderSide:
                                  const BorderSide(color: Palette.errorColor),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(screenHeight * 0.012)),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Palette.errorColor),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(screenHeight * 0.012)),
                            ),
                            errorStyle: const TextStyle(
                              fontFamily: 'Geo',
                              color: Palette.errorColor,
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
                  SizedBox(height: screenHeight * 0.035),
                  SizedBox(
                    width: double.infinity,
                    height: screenHeight * 0.054,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _showSpinning = true;
                          });

                          try {
                            final newUser = await _authentication
                                .createUserWithEmailAndPassword(
                              email: _userEmail,
                              password: _userPassword,
                            );

                            FirebaseFirestore.instance
                                .collection('users')
                                .doc(newUser.user!.uid)
                                .set({
                              'email': _userEmail,
                            });

                            if (!context.mounted) return;
                            Navigator.pop(context);

                            // if (newUser.user != null) {
                            //   if (!context.mounted) return;
                            //   Navigator.pushReplacement(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) =>
                            //               const ChatHomePage()));
                            // }
                          } on FirebaseAuthException catch (e) {
                            debugPrint('$e');
                            setState(() {
                              _showSpinning = false;
                            });

                            if (!context.mounted) return;
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Text(
                                    (e.code == 'email-already-in-use')
                                        ? 'The email address already exists.'
                                        : 'Please try it again later.',
                                    textAlign: TextAlign.center,
                                  ),
                                  contentTextStyle: TextStyle(
                                    fontSize: screenHeight * 0.018,
                                    color: Colors.white,
                                    fontFamily: 'Geo',
                                  ),
                                  backgroundColor: Palette.alertColor,
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        screenHeight * 0.012),
                                  ),
                                  icon: Icon(
                                    Icons.error,
                                    size: screenHeight * 0.06,
                                  ),
                                  iconColor: const Color(0xd0540a0a),
                                );
                              },
                            );
                          }
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
      ),
    );
  }
}
