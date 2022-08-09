import 'package:flutter/material.dart';

class Promotion {
  final String urlImage;
  final String textImage;
  final VoidCallback url;

  Promotion(
      {required this.urlImage, required this.textImage, required this.url});
}
