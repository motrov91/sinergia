import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sinergia_app/provider/slideshow_provider.dart';
//import 'package:sinergia_app/screens/introduction_screen.dart';
import 'package:sinergia_app/screens/screens.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider<SlideshowProvider>(
          create: (_) => SlideshowProvider())
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Sinergia App',
        home: OptionsSessionScreen()
    );
  }
}