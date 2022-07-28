import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:sinergia_app/models/slide.dart';
import 'package:sinergia_app/provider/slideshow_provider.dart';
import 'package:sinergia_app/screens/screens.dart';

/// creación de un PageView para la visualización de un titutial por medio
/// de un Slideshow, la clase Slideshow recibe una lista de tipo Slide en
/// la cual se le pasa un widget(Imagen vectorial) y un String.
/// el slideshow trabaja con provider

class Slideshow extends StatelessWidget {
  final List<Slide> slides;
  final Color primaryColor;
  final Color secondaryColor;
  final double activeDot;
  final double inactiveDot;

  const Slideshow(
      {Key? key,
      required this.slides,
      this.primaryColor = Colors.blueGrey,
      this.secondaryColor = Colors.grey,
      this.activeDot = 20,
      this.inactiveDot = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<SlideshowProvider>(context).primaryColor = primaryColor;
    Provider.of<SlideshowProvider>(context).secondaryColor = secondaryColor;
    Provider.of<SlideshowProvider>(context).sizeItemActive = activeDot;
    Provider.of<SlideshowProvider>(context).sizeItemInactive = inactiveDot;

    return SafeArea(child: Builder(
      builder: (
        BuildContext context,
      ) {
        return _StructureSlideShow(
          dotsPositionUp: true,
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

    double sizeH = MediaQuery.of(context).size.height;

    return Container(
      padding: (sizeH < 670) ? const EdgeInsets.only(bottom: 15) : null,
      child: Column(
        children: [
          if (dotsPositionUp) _Dots(points: slides.length),
          Expanded(
              child: _Slides(
            slides: slides,
          )),
          /** Recibe _Slides la lista de slides */
          if (!dotsPositionUp) _Dots(points: slides.length),
        ],
      ),
    );
  }
}

///_Slides es un stateFullWidget que recibe la lista de tipo slide
///en el _SlideState se crea el constructor para controlar el
///estado de un pageView se crea el controller y con la propiedad
///addListener se escucha los cambios en el pageView y el controller.page
///nos indica en que pagina se encuenta actualmete.
///_Slides recibe una lista de tipo slide la recorre a traves de un map
///y pinta la informacion contenida en esa lista.

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
      Provider.of<SlideshowProvider>(context, listen: false).currentPage =
          controller.page!;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final current = Provider.of<SlideshowProvider>(context).currentPage;

    return Column(
      children: [
        Expanded(
          child: PageView(
            physics: const BouncingScrollPhysics(),
            controller: controller,
            scrollDirection: Axis.horizontal,
            children: widget.slides.map((e) => _Slide(slide: e)).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 20),
          child: (current <= 1.7)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    OptionsSessionScreen())));
                      },
                      child: const Text(
                        'OMITIR',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: const Color(0xffFF9A34),
                      elevation: 0,
                      highlightElevation: 0,
                      onPressed: () => controller.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.decelerate),
                      child: const Icon(Icons.chevron_right),
                    )
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OptionsSessionScreen()))
                        },
                        child: const Text(
                          'COMENZAR',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
        )
      ],
    );
  }
}

/// Recibe un elemento de la lista de tipo Slide para posteriormente pintarlo
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
            Center(
              child: Image(
                image: AssetImage(slide.urlImage),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 100,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  slide.textSlide,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff8130EA)),
                ),
              ),
            )
          ],
        ));
  }
}

///El widget _Dots recibe un entero llamado points el cual es el
///indice del pageView, en el children del Row() se genera una lista con
///la cantidad de puntos points indica la cantidad de puntos que quiere pintar
///luego por medio de una funcion genera la cantidad de veces indicada (points)
///un widget, en nuestro caso _Dot().

class _Dots extends StatelessWidget {
  final int points;

  const _Dots({
    Key? key,
    required this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    final currentPage = Provider.of<SlideshowProvider>(context).currentPage;
    final primaryColor = Provider.of<SlideshowProvider>(context).primaryColor;
    final secondaryColor =
        Provider.of<SlideshowProvider>(context).secondaryColor;
    final active = Provider.of<SlideshowProvider>(context).sizeItemActive;
    final inactive = Provider.of<SlideshowProvider>(context).sizeItemInactive;

    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: (currentPage >= index - 0.1 && currentPage < index + 0.1)
            ? active
            : inactive,
        height: (currentPage >= index - 0.1 && currentPage < index + 0.1)
            ? active
            : inactive,
        decoration: BoxDecoration(
            color: (currentPage >= index - 0.1 && currentPage < index + 0.1)
                ? primaryColor
                : secondaryColor,
            shape: BoxShape.circle),
      ),
    );
  }
}
