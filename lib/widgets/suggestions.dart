import 'package:flutter/material.dart';

class Suggestions extends StatelessWidget {
  const Suggestions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (_, int index) => _ItemSuggestion()),
    );
  }
}

class _ItemSuggestion extends StatelessWidget {
  const _ItemSuggestion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(5),
      width: 130,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xffD3CCE3), Color(0xffE9E4F0)]),
          borderRadius: BorderRadius.circular(10)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Spacer(),
        Text(
          'Tiempo',
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          '12 mins',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Aprende a dominar tus miedos',
          style:
              TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        )
      ]),
    );
  }
}
