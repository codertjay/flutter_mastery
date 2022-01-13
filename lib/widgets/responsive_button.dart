import 'package:flutter/material.dart';
import 'package:flutter_mastery/misc/colors.dart';
import 'package:flutter_mastery/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  double width;
  bool isResponsive;

  ResponsiveButton({Key key, this.width=120, this.isResponsive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? AppText(
                    text: "  Book Trip Now",
                    color: Colors.white,
                  )
                : Container(),
            Image.asset('img/button-one.png'),
          ],
        ),
      ),
    );
  }
}
