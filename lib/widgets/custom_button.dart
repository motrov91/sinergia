import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color colorTop;
  final Color colorBottom;
  final String textButton;
  final bool bgButton;
  final VoidCallback press;

  ///El boton personalizado recibe una propiedad llamada bgButton la cual
  ///indica que si es true el boton usa el color personalizado, de lo
  ///contrario usa el color por defecto.

  const CustomButton(
      {Key? key,
      this.colorTop = const Color(0xffC7C7C7),
      this.colorBottom = const Color(0xff575757),
      required this.textButton,
      this.bgButton = false,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Colors.transparent;
    Size size = MediaQuery.of(context).size;

    return (bgButton)
        ? Container(
            height: size.height * 0.06,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      colorTop,
                      colorBottom,
                    ])),
            width: double.infinity,
            child: MaterialButton(
              highlightColor: color,
              splashColor: color,
              hoverColor: color,
              onPressed: press,
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
        : Container(
            height: size.height * 0.06,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: colorBottom)),
            width: double.infinity,
            child: MaterialButton(
              highlightColor: color,
              splashColor: color,
              hoverColor: color,
              onPressed: press,
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
