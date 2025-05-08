import 'package:flutter/material.dart';

import 'app_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData data() {
    return ThemeData(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Poppins',
      textTheme: TextTheme(
        bodySmall: AppTextStyle.normal.s12,
        bodyMedium: AppTextStyle.normal.s14,
        bodyLarge: AppTextStyle.normal.s16,
        titleMedium: AppTextStyle.normal.medium,
      ),
    );
  }
}