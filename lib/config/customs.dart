import 'package:flutter/material.dart';
import 'package:minchat/config/palette.dart';

class CustomErrorAlertDialog extends AlertDialog {
  final String text;
  final double height;

  CustomErrorAlertDialog({
    super.key,
    required this.text,
    required this.height,
    super.actions,
    super.actionsPadding,
    super.actionsAlignment,
    super.actionsOverflowAlignment,
    super.actionsOverflowDirection,
    super.actionsOverflowButtonSpacing,
  }) : super(
          content: Text(
            text,
            textAlign: TextAlign.center,
          ),
          contentTextStyle: TextStyle(
            fontSize: height * 0.018,
            color: Colors.white70,
            fontFamily: 'Geo',
          ),
          backgroundColor: Palette.alertColor,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(height * 0.012),
          ),
          icon: Icon(
            Icons.error,
            size: height * 0.06,
          ),
          iconColor: Palette.errorColor,
        );
}