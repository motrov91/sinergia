import 'package:flutter/material.dart';
import 'package:sinergia_app/widgets/widgets.dart';

class InteligenciaEmocinalScreen extends StatelessWidget {
  const InteligenciaEmocinalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Inteligencia Emocional',
            style: TextStyle(color: Color(0xffA263F4)),
          ),
        ),
        body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              _HeaderInfo(),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: CustomButton(
                  press: () {},
                  bgButton: true,
                  textButton: 'REALIZAR TEST',
                  colorTop: Color(0xffC69CFD),
                  colorBottom: Color(0xff9C5AF2),
                ),
              ),
              OptionsMenuInteligencia()
            ],
          ),
        ));
  }
}

class _HeaderInfo extends StatelessWidget {
  const _HeaderInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.35,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.purple.withOpacity(0.3),
                blurRadius: 5,
                offset: const Offset(0, 3))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mi coeficiente actual es:',
            style: TextStyle(
                color: Color(0xff9D9D9D), fontWeight: FontWeight.bold),
          ),
          CustomProgressBar(
            valueProgress: 0.9,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Descripción de tu coeficiente emocional actual:',
            style: TextStyle(
                color: Color(0xff9D9D9D), fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            maxLines: size.height < 700 ? 4 : 6,
            'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            style: TextStyle(color: Color(0xff9D9D9D)),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _HitosUsuario(label: "Lecturas realizadas", numeric: 10),
              _HitosUsuario(label: "Retos realizados", numeric: 10),
            ],
          )
        ],
      ),
    );
  }
}

class _HitosUsuario extends StatelessWidget {
  final String label;
  final int? numeric;

  const _HitosUsuario({
    Key? key,
    required this.label,
    this.numeric = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xff9D9D9D)),
        ),
        Text(
          numeric.toString(),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff9D9D9D),
              fontSize: 35),
        ),
      ],
    );
  }
}
