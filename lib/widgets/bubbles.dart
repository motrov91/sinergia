import 'package:flutter/material.dart';

///Este widget se debe usar dentro de un stack
class Bubbles extends StatelessWidget {
  final double? rightB;
  final double? topB;
  final double? leftB;
  final double? bottomB;
  final double widthB;
  final double heigthB;

  const Bubbles({
    Key? key,
    this.rightB,
    this.topB,
    this.leftB,
    this.bottomB,
    required this.widthB,
    required this.heigthB,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: rightB,
        top: topB,
        bottom: bottomB,
        left: leftB,
        child: Container(
          width: widthB,
          height: heigthB,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06), shape: BoxShape.circle),
        ));
  }
}
