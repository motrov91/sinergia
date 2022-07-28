import 'package:flutter/material.dart';

///HelperText inidica un texto auxiliar debajo de la linea del input
///sufix ubica un icono a la derecha del input
///Prefix ubica el icono a la izquierda
class CustomInputLogin extends StatelessWidget {
  final String hintText;
  final String label;
  final String? helperText;
  final IconData? icon;
  final Color colorIcon;
  final IconData? prefixIcon;
  final double marginHorizontal;
  final TextInputType? inputType;
  final bool hideText;

  final String formProperty;
  final void Function(String value)? onPress;

  final Map<String, dynamic> formValues;

  const CustomInputLogin({
    Key? key,
    required this.hintText,
    required this.label,
    this.helperText,
    this.icon,
    this.prefixIcon,
    this.marginHorizontal = 0,
    this.colorIcon = Colors.grey,
    this.onPress,
    required this.formValues,
    required this.formProperty,
    this.inputType,
    this.hideText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;

    return TextFormField(
      onChanged: (value) {
        formValues[formProperty] = value;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo obligatorio';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: inputType,
      obscureText: hideText,
      decoration: _decorator(size),
    );
  }

  InputDecoration _decorator(double size) {
    const Color primary = Color(0xff8130EA);

    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      floatingLabelStyle: const TextStyle(color: primary),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(30)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(30)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purple),
          borderRadius: BorderRadius.circular(30)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(30)),
      contentPadding: const EdgeInsets.only(left: 25),
      border: InputBorder.none,
      hintText: hintText,
      label: (size < 670) ? null : Text(label),
      helperText: helperText,
      prefixIcon: prefixIcon == null
          ? null
          : Icon(
              prefixIcon,
              color: colorIcon,
            ),
    );
  }
}
