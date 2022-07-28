import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import 'package:sinergia_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
            body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [_Background(), _Login()],
          ),
        )),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: const [
              Logo(
                text: "Iniciar Sesión",
              ),
              _Form(),
              Spacer(),
              _OptionsAccount(),
              SizedBox(
                height: 50,
              )
            ],
          ),
        )
      ],
    );
  }
}

class _OptionsAccount extends StatelessWidget {
  const _OptionsAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButtonText(
            text: 'Olvide mi contraseña',
            fWeight: FontWeight.bold,
            size: 16,
            textColor: Colors.grey,
            onPress: () {
              print('print olvide contraseña');
            },
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '¿No tienes una cuenta?',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              const SizedBox(
                width: 7,
              ),
              CustomButtonText(
                  text: 'Registrarme',
                  textColor: const Color(0xffFF9B37),
                  onPress: () {
                    print('Print registrarme');
                  })
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          CustomButtonText(
              text: "Volver",
              size: 15,
              textColor: Colors.grey,
              onPress: () {
                print('press volver');
              })
        ],
      ),
    );
  }
}

class _Form extends StatelessWidget {
  const _Form({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Calculamos el height de la pantalla para posicionar elementos
    double sizeH = MediaQuery.of(context).size.height;

    //Key se usan para mantener las referencias a un widget
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'identificationId': '',
      'password': ''
    };

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 18),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: double.infinity,
      height: (sizeH < 670) ? sizeH * 0.33 : sizeH * 0.30,
      decoration: BoxDecoration(
          color: Colors.white24, borderRadius: BorderRadius.circular(20)),
      child: Form(
        key: myFormKey,
        child: Column(
          children: [
            CustomInputLogin(
              inputType: TextInputType.number,
              onPress: (value) {
                print('value $value');
              },
              hintText: "Documento de identidad",
              label: "Documento:",
              prefixIcon: Icons.person,
              marginHorizontal: 10,
              formProperty: 'identificationId',
              formValues: formValues,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomInputLogin(
              onPress: (value) {
                print('value $value');
              },
              hideText: true,
              hintText: "Contraseña",
              label: "Contraseña",
              prefixIcon: Icons.https,
              marginHorizontal: 10,
              formProperty: 'password',
              formValues: formValues,
            ),
            const Spacer(),
            CustomButton(
              press: () {
                print('formValues ${formValues}');
                if (!myFormKey.currentState!.validate()) {
                  print('formulario no valido');
                  return;
                }
              },
              textButton: "Ingresar",
              colorTop: const Color(0xffC69CFD),
              colorBottom: const Color(0xff9C5AF2),
              bgButton: true,
            )
          ],
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.8,
      child: CustomPaint(
        painter: _CustomBackground(),
      ),
    );
  }
}

class _CustomBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = LinearGradient(
        begin: Alignment.topLeft,
        end: const Alignment(0.8, 1),
        colors: [
          const Color(0xff8130EA).withOpacity(0.7),
          const Color(0xffE6923D).withOpacity(0.7),
        ]);

    final Rect rect =
        Rect.fromCircle(center: const Offset(100, 300.0), radius: 180);

    //Paint Draw
    final paint = Paint()..shader = gradient.createShader(rect);

    //Properties paint
    paint.color = Colors.red;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    ///Punto inicial donde comienza a dibujar el lapiz
    path.lineTo(0, size.height * 0.90);
    //Hace la primera honda (curva) hacia abajo
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.96,
        size.width * 0.5, size.height * 0.90);
    //Hace la segunda honda (curva) hacia arriba
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.85, size.width, size.height * 0.92);
    //ubica el lapiz en la parte superior derecha
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
