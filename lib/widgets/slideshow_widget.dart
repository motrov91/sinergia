import 'package:flutter/material.dart';

import 'package:sinergia_app/models/slide.dart';

/// creación de un PageView para la visualización de un titutial por medio
/// de un Slideshow, la clase Slideshow recibe una lista de tipo Slide en
/// la cual se le pasa un widget(Imagen vectorial) y un String.

class Slideshow extends StatelessWidget {
  final List<Slide> slides;

  const Slideshow({
    Key? key,
    required this.slides,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Builder(
      builder: (
        BuildContext context,
      ) {
        return _StructureSlideShow(
          dotsPositionUp: false,
          slides: slides,
        );
      },
    ));
  }
}

///_StructureSlideShow recibe dos parametros un valor boleano llamado
///dotsPositionUp el cual indica a través de un condicional si los
///puntos se dibujan abajo o arriba de la vista los puntos se dibujan
///en un widget llamado _Dots, recibe los la lista
///de tipo slide para pasarla a un widget llamado _Slides y posterior-
///mente pintar los datos

class _StructureSlideShow extends StatelessWidget {
  final bool dotsPositionUp;
  final List<Slide> slides;

  const _StructureSlideShow({
    Key? key,
    required this.dotsPositionUp,
    required this.slides,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (dotsPositionUp) _Dots(points: slides.length),
        Expanded(
            child: _Slides(
          slides: slides,
        )),
        /** Recibe _Slides la lista de slides */
        if (!dotsPositionUp) _Dots(points: slides.length),
      ],
    );
  }
}

///_Slides es un stateFullWidget que recibe la lista de tipo slide
///en el _SlideState se crea el constructor para controlar el
///estado de un pageView se crea el controller y con la propiedad
///addListener se escucha los cambios en el pageView y el controller.page
///nos indica en que pagina se encuenta actualmete.

class _Slides extends StatefulWidget {
  final List<Slide> slides;

  const _Slides({
    Key? key,
    required this.slides,
  }) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final controller = PageController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      print(controller.page);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: widget.slides.map((e) => _Slide(slide: e)).toList(),
      ),
    );
  }
}

/// recibe un elemento de la lista de tipo Slide para posteriormente pintarlo
class _Slide extends StatelessWidget {
  final Slide slide;

  const _Slide({
    Key? key,
    required this.slide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: Stack(
          children: [
            slide.widget,
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child: Text(
                  slide.textSlide,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ));
  }
}

///El widget _Dots recibe un entero llamado points el cual es el
///indice del pageView.

class _Dots extends StatelessWidget {
  final int points;

  const _Dots({
    Key? key,
    required this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(points, (i) => _Dot(i)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 10,
        height: 10,
        decoration:
            const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
      ),
    );
  }
}
