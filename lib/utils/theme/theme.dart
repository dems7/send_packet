import 'package:flutter/material.dart';
import 'package:send_packet/utils/constants/colors.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: TColors.grey,
    primaryColor: Color.fromARGB(255, 4, 106, 207),
    scaffoldBackgroundColor: Colors.white,
  );
}
