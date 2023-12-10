import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kievit_flutter/shared/color_values.dart';

class AppThemeData {
  ThemeData getTheme() {
    final Color primaryColor = ColorValues().primaryRed;
    final Map<int, Color> primaryColorMap = {
      50: primaryColor,
      100: primaryColor,
      200: primaryColor,
      300: primaryColor,
      400: primaryColor,
      500: primaryColor,
      600: primaryColor,
      700: primaryColor,
      800: primaryColor,
      900: primaryColor,
    };
    final MaterialColor primaryMaterialColor = MaterialColor(primaryColor.value, primaryColorMap);

    return ThemeData(
        canvasColor: Colors.white,
        brightness: Brightness.light,
        primaryColor: primaryColor,
        primarySwatch: primaryMaterialColor,
        textTheme: GoogleFonts.poppinsTextTheme(),
        textSelectionTheme: TextSelectionThemeData(selectionColor: primaryColor.withOpacity(0.5)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 35.0),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
    );
  }
}
