import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sami_ahmed_tentwenty_assignment/core/constants/app_colors.dart';
import 'package:sami_ahmed_tentwenty_assignment/core/constants/app_images.dart';
import 'package:sami_ahmed_tentwenty_assignment/core/theme/app_fonts.dart';

// ignore: must_be_immutable
class CustomAppBarWidget extends StatefulWidget {
  String? title;
  String? trailingIcon;
  bool? hideBackButton;
  Function()? onTapTrailingButton;
  Function()? onTapBackButton;
  Widget? centerWidget;
  CustomAppBarWidget({super.key,this.title,this.trailingIcon,this.hideBackButton,this.onTapTrailingButton,this.onTapBackButton,this.centerWidget});

  @override
  State<CustomAppBarWidget> createState() => _CustomAppBarWidgetState();
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      color: AppColors.whiteColor,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.hideBackButton==null?_backButton():Offstage(),
            widget.hideBackButton==null?SizedBox(width: 15.w,):Offstage(),
            Expanded(child: widget.centerWidget ?? Text(widget.title!,style: AppTextStyle.medium.s16,)),
            SizedBox(width: 15.w,),
            widget.trailingIcon!=null?_trailingButton():Offstage()
          ],
        ),
      ),
    );
  }

  _backButton(){
    return InkWell(
        onTap: widget.onTapBackButton ?? (){
          context.pop();
        },
        child: SvgPicture.asset(ImagePath.back)
    );
  }

  _trailingButton(){
    return InkWell(
        onTap: widget.onTapTrailingButton,
        child: SvgPicture.asset(widget.trailingIcon!));
  }
}
