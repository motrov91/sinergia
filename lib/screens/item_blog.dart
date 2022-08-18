import 'package:flutter/material.dart';
import 'package:sinergia_app/widgets/widgets.dart';

class ItemBlogScreen extends StatelessWidget {
  final Color colorLeft;
  final Color colorRight;
  const ItemBlogScreen(
      {Key? key,
      this.colorLeft = Colors.blueGrey,
      this.colorRight = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            colorLeft,
            colorRight,
          ])),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.35,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_BackButtom(), Spacer(), _Chip(), _TitleNotice()],
              ),
              const _Bubbles(),
            ],
          ),
        ),
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.30),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
          ),
          child: Stack(children: [
            Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                'Tiempo de lectura',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text('12 minutos'),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas “Letraset”, las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.Es un hecho establecido hace demasiado tiempo que un lector se distraerá con el contenido del texto de un sitio mientras que mira su diseño. El punto de usar Lorem Ipsum es que tiene una distribución más o menos normal de las letras, al contrario de usar textos como por ejemplo “Contenido aquí, contenido aquí”. Estos textos hacen parecerlo un español que se puede leer. Muchos paquetes de autoedición y editores de páginas web usan el Lorem Ipsum como su texto por defecto, y al hacer una búsqueda de “Lorem Ipsum” va a dar por resultado muchos sitios web que usan este texto si se encuentran en estado de desarrollo. Muchas versiones han evolucionado a través de los años,',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Articulos recomendados para ti',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Suggestions(),
                            SizedBox(
                              height: 20,
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(right: 20, child: _IconsOptions())
          ]),
        )
      ],
    ));
  }
}

class _IconsOptions extends StatelessWidget {
  const _IconsOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconItem(icon: Icons.favorite),
        CustomIconItem(icon: Icons.bookmark),
        CustomIconItem(icon: Icons.reply),
      ],
    );
  }
}

class _TitleNotice extends StatelessWidget {
  const _TitleNotice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 65, left: 10),
      child: Text(
        'Como reaccionar ante un posible ataque',
        style: TextStyle(
            fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 5, left: 10, bottom: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Text(
        'Manejo del miedo',
        style: TextStyle(fontSize: 10),
      ),
    );
  }
}

class _Bubbles extends StatelessWidget {
  const _Bubbles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: const [
      Bubbles(
        widthB: 120,
        heigthB: 120,
        rightB: -10,
      ),
      Bubbles(
        widthB: 80,
        heigthB: 80,
        rightB: 140,
        topB: 40,
      ),
      Bubbles(
        widthB: 30,
        heigthB: 30,
        rightB: 100,
        topB: 110,
      ),
      Bubbles(
        widthB: 60,
        heigthB: 60,
        rightB: 10,
        topB: 130,
      ),
    ]);
  }
}

class _BackButtom extends StatelessWidget {
  const _BackButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        margin: const EdgeInsets.only(top: 40, left: 10),
        width: 50,
        height: 50,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white54),
        child: const Icon(
          Icons.chevron_left,
          size: 30,
        ),
      ),
    );
  }
}
