import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sinergia_app/models/slide.dart';

import 'package:sinergia_app/widgets/slideshow_widget.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(
            child: Slideshow(
          slides: [
            Slide(
                widget: SvgPicture.asset('assets/slide_1.svg'),
                textSlide: 'Esta la informacion del estado 1'),
            Slide(
                widget: SvgPicture.asset('assets/slide_2.svg'),
                textSlide: 'Esta la informacion del estado 2'),
            Slide(
                widget: SvgPicture.asset('assets/slide_3.svg'),
                textSlide: 'Esta la informacion del estado 3'),
          ],
        ))
      ],
    ));
  }
}
