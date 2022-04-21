import 'package:flutter/material.dart';
import 'package:project_monetin/app/theme/theme.dart';

class CustomPrimaryButton extends StatelessWidget {
  final Color buttonColor;
  final String textValue;
  final Color textColor;

  const CustomPrimaryButton(
      {this.buttonColor = Colors.black,
      this.textValue = '',
      this.textColor = Colors.black});
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(66),
      elevation: 0,
      child: Container(
        height: 56,
        width: 128,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(66)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(66),
            child: Center(
              child: Text(
                textValue,
                style: heading5.copyWith(color: textColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
