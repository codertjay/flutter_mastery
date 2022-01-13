import 'package:flutter/material.dart';
import 'package:flutter_mastery/misc/colors.dart';
import 'package:flutter_mastery/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  // const AppButton({Key? key}) : super(key: key);
  final Color color;
  String text;
  IconData icon;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  bool isIcon;

  AppButtons(
      {Key key,
      @required this.size,
      this.text = "Hi",
      this.icon,
      this.isIcon = false,
      @required this.color,
      @required this.backgroundColor,
      @required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 1.0),
            borderRadius: BorderRadius.circular(15),
            color: backgroundColor),
        child: isIcon == false
            ? Center(
              child: AppText(
                  text: text,
                  color: color,
                ),
            )
            : Center(
              child: Icon(
                  icon,
                  color: color,
                ),
            ));
  }
}
