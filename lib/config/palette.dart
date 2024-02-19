import 'package:flutter/painting.dart';

class Palette {
  static const Color alertColor = Color(0xff9a9dde);
  static const Color errorColor = Color(0xd0540a0a);
  static const Color backgroundStartColor = Color.fromRGBO(201, 161, 255, 1);
  static const Color backgroundEndColor = Color.fromRGBO(140, 173, 255, 1);
  static const Color appBarIconColor = Color(0xff340e3e);

  static const LinearGradient backgroundGradient = LinearGradient(
    // 배경 그라데이션
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(201, 161, 255, 1),
      Color.fromRGBO(140, 173, 255, 1),
    ],
  );
}
