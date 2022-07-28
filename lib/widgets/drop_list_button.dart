import 'package:flutter/material.dart';
import 'package:sinergia_app/models/droplist.dart';

class DropListButton extends StatelessWidget {
  final String hint;
  final List<DropList> items;
  final String formProperty;
  final Map<String, dynamic> formValues;

  const DropListButton({
    Key? key,
    required this.items,
    required this.hint,
    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.only(left: 11, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      child: Center(
        child: DropdownButtonFormField(
          hint: Text(hint),
          decoration: const InputDecoration.collapsed(
            hintText: '',
          ),
          items: items
              .map((e) => DropdownMenuItem(
                    child: Text(e.descripcion),
                    value: e.value,
                  ))
              .toList(),
          onChanged: (value) {
            print('value $value');
            formValues[formProperty] = value;
            //formValues['role'] = value ?? 'CC'
          },
        ),
      ),
    );
  }
}
