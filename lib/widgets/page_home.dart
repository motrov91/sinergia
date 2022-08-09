import 'package:flutter/material.dart';

import 'package:sinergia_app/widgets/widgets.dart';

class PageHome extends StatelessWidget {
  const PageHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _HeaderHome(),
            Padding(
              padding: EdgeInsets.only(
                left: 30,
              ),
              child: Text(
                'Categorias',
                style: TextStyle(
                    color: Color(0xff707070),
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ),
            OptionsMenuHome()
          ],
        ));
  }
}

class _HeaderHome extends StatelessWidget {
  const _HeaderHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: (size.height < 700) ? size.height * 0.45 : size.height * 0.40,
      child: Stack(
        children: [
          const _BackgroundHeader(),
          const _Bubbles(),
          Column(
            children: const [
              _PersonalData(),
              SizedBox(height: 10),
              Carrousel(),
            ],
          )
        ],
      ),
    );
  }
}

class _BackgroundHeader extends StatelessWidget {
  const _BackgroundHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeH = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: sizeH * 0.23,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                const Color(0xffFF9A34).withOpacity(0.8),
                const Color(0xff8130EA).withOpacity(0.8),
              ]),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
    );
  }
}

class _Bubbles extends StatelessWidget {
  const _Bubbles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeH = MediaQuery.of(context).size.height;

    return Container(
      height: sizeH * 0.3,
      child: Stack(
        children: const [
          Bubbles(
            topB: -20,
            rightB: -25,
            widthB: 110,
            heigthB: 110,
          ),
          Bubbles(
            topB: 20,
            rightB: 100,
            widthB: 70,
            heigthB: 70,
          ),
          Bubbles(
            widthB: 25,
            heigthB: 25,
            topB: 90,
            rightB: 90,
          ),
          Bubbles(
            widthB: 30,
            heigthB: 30,
            topB: 95,
            rightB: -8,
          ),
          Bubbles(
            bottomB: -20,
            leftB: -25,
            widthB: 110,
            heigthB: 110,
          ),
          Bubbles(
            widthB: 30,
            heigthB: 30,
            bottomB: 95,
            leftB: -8,
          ),
          Bubbles(
            widthB: 30,
            heigthB: 30,
            leftB: 130,
            topB: 100,
          )
        ],
      ),
    );
  }
}

class _PersonalData extends StatelessWidget {
  const _PersonalData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 13, right: 25),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Row(
          children: [
            const CircleAvatar(
                maxRadius: 30,
                backgroundImage: NetworkImage(
                    'https://dam.esquirelat.com/wp-content/uploads/2020/07/STANLEE.jpg')),
            SizedBox(
              width: 13,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Bienvenido',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Ruben Dario Lopez rodriguez',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Estudiante',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.notifications,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
