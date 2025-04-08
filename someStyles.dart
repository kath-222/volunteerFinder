import 'package:flutter/material.dart';

class StyleMainText extends StatelessWidget {
  const StyleMainText({required this.text, required this.colour, super.key});

  final String text;
  final dynamic colour;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: colour,
        letterSpacing: 2, // Added letter spacing
        fontFamily: 'Roboto', // Added font family for style
      ),
    );
  }
}

class StyleSubText extends StatelessWidget {
  const StyleSubText({required this.text, required this.colour, super.key});

  final String text;
  final dynamic colour;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: colour,
        letterSpacing: 1,
        fontFamily: 'Roboto',
      ),
    );
  }
}
