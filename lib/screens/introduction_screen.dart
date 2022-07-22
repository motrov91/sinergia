import 'package:flutter/material.dart';
import 'package:sinergia_app/models/slide.dart';

import 'package:sinergia_app/widgets/slideshow_widget.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
            Color(0xffB881DA).withOpacity(0.3),
            Color(0xffFF9A34).withOpacity(0.4),
          ])),
      child: Row(
        children: [
          Expanded(
              child: Slideshow(
            primaryColor: Color(0xffFF9A34),
            secondaryColor: Color(0xffB881DA),
            slides: [
              Slide(
                  urlImage: 'assets/imageOne.png',
                  textSlide:
                      'Aprende a gestionar tus emociones y crece personal, espirutual y sentimentamente, nosotros te enseñamos como hacerlo'),
              Slide(
                  urlImage: 'assets/imageTwo.png',
                  textSlide:
                      'Aprende a reconocer la íra, el amor, la tristeza, la alegria, el miedo y cada uno de los sentimientos que te llevan a tomar buenas y malas decisiones.'),
              Slide(
                  urlImage: 'assets/imageThree.png',
                  textSlide:
                      'Aprende a meditar, lleva tu mente y tu cuerpo a otro nivel, desarrolla uno de los musculos más potente que tiene nuestro cuerpo, el cerebro.'),
            ],
          ))
        ],
      ),
    ));
  }
}
