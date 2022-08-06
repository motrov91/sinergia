import 'package:flutter/material.dart';

class OptionsMenuHome extends StatelessWidget {
  const OptionsMenuHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 20, bottom: 12),
                height: double.infinity,
                child: Column(
                  children: const [
                    _ButtonBox(
                        textBox: "inteligencia emocional",
                        imageBox: 'assets/brain.png',
                        widthImage: 100,
                        flexBox: 2,
                        colorOne: Color(0xffFEA6AF),
                        colorTwo: Color(0xffFF8D94),
                        colorThree: Color(0xffFE7881)),
                    _ButtonBox(
                        textBox: "Habla con EMI",
                        imageBox: 'assets/chat.png',
                        widthImage: 100,
                        colorOne: Color(0xff8262E7),
                        colorTwo: Color(0xff6D94E5),
                        colorThree: Color(0xff54E0F3)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 20, bottom: 12),
                height: double.infinity,
                child: Column(
                  children: const [
                    _ButtonBox(
                        textBox: "Charlas",
                        imageBox: 'assets/podcast.png',
                        widthImage: 60,
                        colorOne: Color(0xffBEEFFF),
                        colorTwo: Color(0xff74D6F5),
                        colorThree: Color(0xff19C1F4)),
                    _ButtonBox(
                        flexBox: 2,
                        textBox: "Para ti",
                        imageBox: 'assets/for_you.png',
                        widthImage: 100,
                        colorOne: Color(0xffCBACFA),
                        colorTwo: Color(0xffA19CEF),
                        colorThree: Color(0xff8597EF)),
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

  const _ButtonBox({
    Key? key,
    required this.colorOne,
    required this.colorTwo,
    required this.colorThree,
    this.flexBox = 1,
    required this.textBox,
    required this.imageBox,
    required this.widthImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flexBox,
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
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
