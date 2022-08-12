import 'package:flutter/material.dart';

class OptionsMenuInteligencia extends StatelessWidget {
  const OptionsMenuInteligencia({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 10, bottom: 12),
                height: double.infinity,
                child: Column(
                  children: [
                    _ButtonBox(
                        textBox: "MANEJO DE LA ÍRA",
                        imageBox: 'assets/emoji_ira.png',
                        widthImage: 30,
                        colorOne: const Color(0xffB3B5EB),
                        colorTwo: const Color(0xff7D88F3),
                        colorThree: const Color(0xff6F6DF4),
                        tap: () {}),
                    _ButtonBox(
                      textBox: "INTELIGENCIA EMOCIONAL",
                      imageBox: 'assets/emogi_inteligencia.png',
                      widthImage: 30,
                      colorOne: const Color(0xff7BEAD8),
                      colorTwo: const Color(0xff3FCCB6),
                      colorThree: const Color(0xff38BCA8),
                      tap: () {},
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 10, bottom: 12),
                height: double.infinity,
                child: Column(
                  children: [
                    _ButtonBox(
                      textBox: "MANEJO DEL MIEDO",
                      imageBox: 'assets/emoji_miedo.png',
                      widthImage: 30,
                      colorOne: const Color(0xffFDBCCF),
                      colorTwo: const Color(0xffFC84A7),
                      colorThree: const Color(0xffED6693),
                      tap: () {},
                    ),
                    _ButtonBox(
                      textBox: "RETOS",
                      imageBox: 'assets/emoji_retos.png',
                      widthImage: 30,
                      colorOne: const Color(0xffEBB3B3),
                      colorTwo: const Color(0xffF37D7D),
                      colorThree: const Color(0xffF46D6D),
                      tap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ButtonBox extends StatelessWidget {
  final Color colorOne;
  final Color colorTwo;
  final Color colorThree;
  final int flexBox;
  final String textBox;
  final String imageBox;
  final double widthImage;
  final VoidCallback tap;

  const _ButtonBox({
    Key? key,
    required this.colorOne,
    required this.colorTwo,
    required this.colorThree,
    // ignore: unused_element
    this.flexBox = 1,
    required this.textBox,
    required this.imageBox,
    required this.widthImage,
    required this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flexBox,
        child: GestureDetector(
          onTap: tap,
          child: Stack(children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [colorOne, colorTwo, colorThree]),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(40))),
              child: Container(
                alignment: Alignment.center,
                width: 140,
                child: Text(
                  textBox.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize:
                        MediaQuery.of(context).size.height < 680 ? 12 : 14,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            Positioned(
                top: 0,
                left: 15,
                child: SizedBox(
                    width: widthImage,
                    child: Image(image: AssetImage(imageBox)))),
            Column(
              children: [
                const Spacer(),
                Text(
                  '10/30',
                  style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.height < 680 ? 12 : 14,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.white,
                      color: Color(0xffF89B34),
                      value: 0.2,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            )
          ]),
        ));
  }
}
