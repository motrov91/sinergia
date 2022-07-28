import 'package:flutter/material.dart';
import 'package:sinergia_app/widgets/custom_input_register.dart';
import 'package:sinergia_app/widgets/widgets.dart';

import '../models/droplist.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
      child: Scaffold(
          body: Stack(
        children: [
          _Background(),
          Column(
            children: [
              Logo(
                text: "Registro",
              ),
              SizedBox(
                height: 25,
              ),
              _RegisterForm()
            ],
          )
        ],
      )),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white70,
        ),
        child: _Form(),
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
    final GlobalKey<FormState> myFormRegisterKey = GlobalKey<FormState>();

    final Map<String, dynamic> formValuesRegister = {
      'mail': '',
      'typeDocument': '',
      'documentId': '',
      'names': '',
      'surnames': '',
      'date': '',
      'cellphone': '',
      'schoolName': '',
      'course': '',
      'nomenclature': '',
    };

    return Form(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomInputRegister(
              onPress: (value) {},
              marginHorizontal: 8,
              hintText: 'Correo Electronico',
              label: 'Correo:',
              prefixIcon: Icons.check_circle,
              colorIcon: Colors.green,
              formProperty: 'mail',
              formValuesRegister: formValuesRegister,
            ),
            DropListButton(
                formValues: formValuesRegister,
                formProperty: 'typeDocument',
                hint: "Tipo de documento",
                items: [
                  DropList(value: 'RC', descripcion: 'Registro civil'),
                  DropList(value: 'TI', descripcion: 'Tarjeta de identidad'),
                  DropList(value: 'CC', descripcion: 'Cedula de ciudadania'),
                  DropList(value: 'CD', descripcion: 'Pasaporte'),
                ]),
            CustomInputRegister(
              inputType: TextInputType.number,
              marginHorizontal: 8,
              hintText: 'Número de documento de identidad',
              label: 'Documento de identidad',
              prefixIcon: Icons.check_circle,
              colorIcon: Colors.green,
              formProperty: 'documentId',
              formValuesRegister: formValuesRegister,
            ),
            //
            CustomInputRegister(
              marginHorizontal: 8,
              hintText: 'Nombres completos',
              label: 'Nombres:',
              prefixIcon: Icons.check_circle,
              colorIcon: Colors.green,
              formProperty: 'names',
              formValuesRegister: formValuesRegister,
            ),
            CustomInputRegister(
              marginHorizontal: 8,
              hintText: 'Apellidos',
              label: 'Apellidos:',
              prefixIcon: Icons.check_circle,
              colorIcon: Colors.green,
              formProperty: 'surnames',
              formValuesRegister: formValuesRegister,
            ),
            DatePicker(
              formProperty: 'date',
              formValuesRegister: formValuesRegister,
            ),
            CustomInputRegister(
              marginHorizontal: 8,
              hintText: 'Celular',
              label: 'Celular:',
              inputType: TextInputType.number,
              formProperty: 'cellphone',
              formValuesRegister: formValuesRegister,
            ),
            CustomInputRegister(
              marginHorizontal: 8,
              hintText: 'Nombre del colegio',
              label: 'Colegio:',
              prefixIcon: Icons.check_circle,
              colorIcon: Colors.green,
              formProperty: 'schoolName',
              formValuesRegister: formValuesRegister,
            ),
            DropListButton(
                formValues: formValuesRegister,
                formProperty: 'course',
                hint: "Grado que cursa actualmente",
                items: [
                  DropList(value: '6', descripcion: 'Sexto'),
                  DropList(value: '7', descripcion: 'Septimo'),
                  DropList(value: '8', descripcion: 'Octavo'),
                  DropList(value: '9', descripcion: 'Noveno'),
                  DropList(value: '10', descripcion: 'Decimo'),
                  DropList(value: '11', descripcion: 'Once'),
                ]),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: const Text(
                'En caso de pertenecer a un curso con nomenclatura seleccione la de su curso ejemplo (6A - 7B), en caso de no tener omita el item nomenclatura del curso',
                style: TextStyle(fontSize: 12),
              ),
            ),
            DropListButton(
                formValues: formValuesRegister,
                formProperty: 'nomenclature',
                hint: "Nomenclatura de curso",
                items: [
                  DropList(value: 'A', descripcion: 'A'),
                  DropList(value: 'B', descripcion: 'B'),
                  DropList(value: 'C', descripcion: 'C'),
                  DropList(value: 'D', descripcion: 'D'),
                  DropList(value: 'E', descripcion: 'E'),
                  DropList(value: 'F', descripcion: 'F'),
                ]),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              press: () {
                print('FormValues ${formValuesRegister}');
              },
              textButton: 'Registrar',
              bgButton: true,
              colorTop: const Color(0xffC69CFD),
              colorBottom: const Color(0xff9C5AF2),
            ),
            const SizedBox(
              height: 30,
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
    var boxDecoration = const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
          Color(0xffAA71EB),
          Color(0xffC285C8),
          Color(0xffEBA78E),
        ]));

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: boxDecoration,
    );
  }
}
