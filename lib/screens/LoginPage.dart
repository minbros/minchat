import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _focusNode = FocusNode();
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
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
                Container(
                  padding: const EdgeInsets.only(top: 150),
                  child: const Text(
                    'Welcome,',
                    style: TextStyle(
                      fontFamily: 'Geo',
                      fontWeight: FontWeight.bold,
                      fontSize: 33,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Glad to see you!
                const Text(
                  'Glad to see you!',
                  style: TextStyle(
                    fontFamily: 'Geo',
                    fontSize: 33,
                    letterSpacing: -1,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: screenWidth * 0.8,
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
                        Focus(
                          child: TextFormField(
                            focusNode: _focusNode,
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
                              suffixIcon: _focusNode.hasFocus
                                  ? IconButton(
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
                                    )
                                  : null,
                            ),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontFamily: 'Geo',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: screenWidth * 0.8,
                          child: GestureDetector(
                            onTap: () {},   // 비밀번호 찾기 기능 구현 필요
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Geo',
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white70,
                                decorationStyle: TextDecorationStyle.dotted,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: screenWidth * 0.8,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {},   // 로그인 이후 구현 필요
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
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
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
