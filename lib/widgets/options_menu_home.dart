import 'package:flutter/material.dart';
import 'package:sinergia_app/screens/screens.dart';

class OptionsMenuHome extends StatelessWidget {
  const OptionsMenuHome({
    Key? key,
  }) : super(key: key);

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
                        textBox: "inteligencia emocional",
                        imageBox: 'assets/brain.png',
                        widthImage: 100,
                        flexBox: 2,
                      colorOne: const Color(0xffFEA6AF),
                      colorTwo: const Color(0xffFF8D94),
                      colorThree: const Color(0xffFE7881),
                      tap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    InteligenciaEmocinalScreen()));
                      },
                    ),
                    _ButtonBox(
                        textBox: "Habla con EMI",
                        imageBox: 'assets/chat.png',
                        widthImage: 100,
                      colorOne: const Color(0xff8262E7),
                      colorTwo: const Color(0xff6D94E5),
                      colorThree: const Color(0xff54E0F3),
                      tap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HablaConEmiScreen()));
                      },
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
                        textBox: "Charlas",
                        imageBox: 'assets/podcast.png',
                        widthImage: 60,
                      colorOne: const Color(0xffBEEFFF),
                      colorTwo: const Color(0xff74D6F5),
                      colorThree: const Color(0xff19C1F4),
                      tap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CharlasScreen()));
                      },
                    ),
                    _ButtonBox(
                        flexBox: 2,
                        textBox: "Para ti",
                        imageBox: 'assets/for_you.png',
                        widthImage: 100,
                      colorOne: const Color(0xffCBACFA),
                      colorTwo: const Color(0xffA19CEF),
                      colorThree: const Color(0xff8597EF),
                      tap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ParaTiScreen()));
                      },
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
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            padding: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [colorOne, colorTwo, colorThree]),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned(
                    right: 0,
                    top: 0,
                    child: SizedBox(
                        width: widthImage,
                        child: Image(image: AssetImage(imageBox)))),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: 140,
                    child: Text(
                      textBox.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
