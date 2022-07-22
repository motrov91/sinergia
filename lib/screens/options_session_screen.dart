import 'package:flutter/material.dart';
import 'package:sinergia_app/widgets/widgets.dart';

class OptionsSessionScreen extends StatelessWidget {
  const OptionsSessionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  children: const [
                    Text('Bienvenido',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xffB881DA),
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Inicia sesión si ya creaste una cuenta, en caso de que aun no tengas una cuenta creala para que puedas acceder a lo mejor de nuestro contenido.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xffB881DA)),
                    ),
                  ],
                ),
              ),
              const Image(image: AssetImage('assets/imageFour.png')),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                child: Column(
                  children: const [
                    CustomButton(
                      bgButton: true,
                      textButton: "Iniciar Sesion",
                      colorTop: Color(0xffFFC488),
                      colorBottom: Color(0xffFF9A34),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      textButton: "Registrarme",
                      colorTop: Color(0xffFFC488),
                      colorBottom: Color(0xffFF9A34),
                    ),
                  ],
                ),
              )
            ]),
      ),
    ));
  }
}
