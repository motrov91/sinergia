import 'package:flutter/material.dart';

class CustomButtonText extends StatelessWidget {
  final String text;
  final FontWeight? fWeight;
  final double size;
  final Color textColor;
  final VoidCallback onPress;

  const CustomButtonText(
      {Key? key,
      required this.text,
      this.fWeight,
      this.size = 14,
      this.textColor = Colors.black,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Text(
        text,
        style: TextStyle(
            color: textColor,
            fontWeight: (fWeight != null) ? fWeight : FontWeight.normal,
            fontSize: size),
      ),
    );
  }
}
