import 'package:flutter/material.dart';

class CustomIconItem extends StatelessWidget {
  final IconData icon;

  const CustomIconItem({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 50,
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey, offset: Offset(1, 3), blurRadius: 6)
      ], shape: BoxShape.circle, color: Colors.white),
      child: Icon(
        icon,
        color: Color(0xff727272),
      ),
    );
  }
}
