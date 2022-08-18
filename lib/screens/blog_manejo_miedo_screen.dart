import 'package:flutter/material.dart';
import 'package:sinergia_app/widgets/widgets.dart';

class BlogManejoMiedoScreen extends StatelessWidget {
  const BlogManejoMiedoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Manejo del miedo',
          style: (TextStyle(color: Color(0xffED6693))),
        ),
        elevation: 0,
      ),
      body: Center(
        child: BlogStructure(
          ItemColorLeft: Color(0xffFC9CB8),
          ItemColorRight: Color(0xffED6693),
          MenuOptionColorLeft: Color(0xffFB99B6),
          MenuOptionColorRight: Color(0xffF0709A),
        ),
      ),
    );
  }
}
