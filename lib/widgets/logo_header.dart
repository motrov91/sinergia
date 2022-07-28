import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String text;

  const Logo({
    Key? key,
    this.text = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
                child:
                    const Image(image: AssetImage('assets/sinergiaLogo.png'))),
            Text(
              (text.isNotEmpty) ? text : '',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
