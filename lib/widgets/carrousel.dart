import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sinergia_app/models/promotion.dart';
import 'package:sinergia_app/provider/carrousel_provider.dart';

class Carrousel extends StatelessWidget {
  const Carrousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
      width: size.width,
      height: size.height * 0.23,
      child: Column(
        children: [
          _Slides(
            promotion: [
              Promotion(
                  urlImage: 'assets/promotion.png',
                  textImage: 'Concentrate y logra tus objetivos',
                  url: () => print('oprimiendo la promo1')),
              Promotion(
                  urlImage: '',
                  textImage: 'Aprende a controlar tu mente',
                  url: () => print('oprimiendo la promo2')),
              Promotion(
                  urlImage: '',
                  textImage: 'Has una pausa y encuentra tu ser',
                  url: () => print('oprimiendo la promo3')),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          _Dots()
        ],
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.03,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final page = Provider.of<CarrouselProvider>(context).currentPage;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: 11,
      decoration: BoxDecoration(
          color: (page >= index - 0.2 && page < index + 0.2)
              ? Color(0xff8130EA)
              : Color(0xffB881DA),
          shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Promotion> promotion;

  const _Slides({
    Key? key,
    required this.promotion,
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
      Provider.of<CarrouselProvider>(context, listen: false).currentPage =
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
    return Expanded(
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(23), boxShadow: [
          BoxShadow(
              color: Colors.purple.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 1))
        ]),
        child: PageView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: widget.promotion
              .map((e) => _promotion(
                    promo: e,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class _promotion extends StatelessWidget {
  final Promotion promo;

  const _promotion({
    Key? key,
    required this.promo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: promo.url,
      child: Container(
        child: Stack(children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(23),
              child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage(
                    'assets/loading.gif',
                  ),
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxtxRFT5w2sR6PWJ5Y4ZQXN70y8G-4zAXIPrziU-ERm2OIvJy1Sphhc0SpBuDkJ5DgoMs&usqp=CAU')),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.bottomLeft,
            height: double.infinity,
            child: Text(
              promo.textImage,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.purple,
                  fontWeight: FontWeight.w500),
            ),
          )
        ]),
      ),
    );
  }
}
