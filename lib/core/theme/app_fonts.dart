import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class AppTextStyle {
  AppTextStyle._();
  static TextStyle normal = const TextStyle(fontWeight: FontWeight.normal);
  static TextStyle bold = const TextStyle(fontWeight: FontWeight.bold);
  static TextStyle semiBold = const TextStyle(fontWeight: FontWeight.w600);
  static TextStyle medium = const TextStyle(fontWeight: FontWeight.w500);
}

extension AppFontSize on TextStyle {

  TextStyle get s10 {
    return copyWith(fontSize: 10.sp,color: AppColors.blackColor);
  }

  TextStyle get s12 {
    return copyWith(fontSize: 12.sp,color: AppColors.blackColor);
  }

  TextStyle get s14 {
    return copyWith(fontSize: 14.sp,color: AppColors.blackColor);
  }

  TextStyle get s16 {
    return copyWith(fontSize: 16.sp,color: AppColors.blackColor);
  }

  TextStyle get s18 {
    return copyWith(fontSize: 18.sp,color: AppColors.blackColor);
  }

  TextStyle get s20 {
    return copyWith(fontSize: 20.sp,color: AppColors.blackColor);
  }

  TextStyle get s22 {
    return copyWith(fontSize: 22.sp,color: AppColors.blackColor);
  }

  TextStyle get s24 {
    return copyWith(fontSize: 24.sp,color: AppColors.blackColor);
  }

  TextStyle get medium {
    return copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600,color: AppColors.blackColor);
  }
}