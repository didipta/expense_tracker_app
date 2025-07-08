import 'package:flutter/material.dart';

const int _customPurplePrimaryValue = 0xFF4F378A;

const MaterialColor customPurple = MaterialColor(
  _customPurplePrimaryValue,
  <int, Color>{
    50: Color(0xFFEDEAF3),
    100: Color(0xFFD2CBE2),
    200: Color(0xFFB3A9D0),
    300: Color(0xFF9486BD),
    400: Color(0xFF65558F),
    500: Color(_customPurplePrimaryValue),
    600: Color(0xFF483282),
    700: Color(0xFF3F2B77),
    800: Color(0xFF37256D),
    900: Color(0xFF281A5B),
  },
);
