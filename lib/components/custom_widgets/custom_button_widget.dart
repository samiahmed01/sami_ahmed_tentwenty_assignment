import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sami_ahmed_tentwenty_assignment/core/theme/app_fonts.dart';

import '../../core/constants/app_colors.dart';

// ignore: must_be_immutable
class CustomButtonWidget extends StatelessWidget {
  Color? background;
  String? title;
  IconData? icon;
  Function()? onTap;
  CustomButtonWidget({super.key,this.background,this.title,this.icon,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 52.h,
        decoration: BoxDecoration(
          color: background ?? Colors.transparent,
          border: Border.all(color: AppColors.lightBlueColor),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon==null?Offstage():Icon(icon,color: AppColors.whiteColor,),
            icon==null?Offstage():SizedBox(width: 10.w,),
            Text(title!,style: AppTextStyle.semiBold.s16.copyWith(color: AppColors.whiteColor),)
          ],
        ),
      ),
    );
  }
}
