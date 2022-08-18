import 'package:flutter/material.dart';
import 'package:sinergia_app/widgets/widgets.dart';

class BlogManejoIraScreen extends StatelessWidget {
  const BlogManejoIraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Manejo de la ira',
            style: TextStyle(color: Color(0xff858AF2)),
          ),
          backgroundColor: Colors.white,
        ),
        body: BlogStructure(
          ItemColorLeft: Color(0xff9FA4EE),
          ItemColorRight: Color(0xff777CF4),
          MenuOptionColorLeft: Color(0xff2E9EF3),
          MenuOptionColorRight: Color(0xff5A62FA),
        ));
  }
}
