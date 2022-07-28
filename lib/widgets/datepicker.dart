import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sinergia_app/provider/datepicker_provider.dart';

class DatePicker extends StatelessWidget {
  final Map<String, dynamic> formValuesRegister;
  final String formProperty;

  const DatePicker({
    Key? key,
    required this.formValuesRegister,
    required this.formProperty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final birthday = Provider.of<DatePickerProvider>(context);

    var sizedBox = const SizedBox(height: 5);
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Fecha de nacimiento',
          style: TextStyle(
              color: Color(0xff9D9D9D),
              fontWeight: FontWeight.w700,
              fontSize: 16),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text(
                  'Año',
                  style: TextStyle(color: Colors.grey),
                ),
                sizedBox,
                Text(
                  '${birthday.dateSelected.year}',
                  style: const TextStyle(
                      color: Color(0xff9D9D9D), fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  'Mes',
                  style: TextStyle(color: Colors.grey),
                ),
                sizedBox,
                Text(
                  '${birthday.dateSelected.month}',
                  style: const TextStyle(
                      color: Color(0xff9D9D9D), fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  'Día',
                  style: TextStyle(color: Colors.grey),
                ),
                sizedBox,
                Text(
                  '${birthday.dateSelected.day}',
                  style: const TextStyle(
                      color: Color(0xff9D9D9D), fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        MaterialButton(
          elevation: 0,
          onPressed: () async {
            DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: birthday.dateSelected,
              firstDate: DateTime(1960),
              lastDate: DateTime(2050),
            );

            formValuesRegister[formProperty] = newDate;

            if (newDate == null) return;

            birthday.dateSelected = newDate;
          },
          color: const Color(0xff8130EA),
          child: const Text(
            'Seleccionar Fecha',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
