import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color colorTop;
  final Color colorBottom;
  final String textButton;
  final bool bgButton;

  const CustomButton(
      {Key? key,
      this.colorTop = const Color(0xffC7C7C7),
      this.colorBottom = const Color(0xff575757),
      required this.textButton,
      this.bgButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (bgButton)
        ? MaterialButton(
            onPressed: () {},
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        colorTop,
                        colorBottom,
                      ])),
              child: Center(
                  child: Text(
                textButton,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              )),
            ),
          )
        : MaterialButton(
            onPressed: () {},
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: colorBottom)),
              child: Center(
                  child: Text(
                textButton,
                style: TextStyle(
                    color: colorBottom,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              )),
            ),
          );
  }
}
