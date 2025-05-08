import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/custom_widgets/custom_app_bar_widget.dart';
import '../../../components/custom_widgets/custom_button_widget.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/theme/app_fonts.dart';
import '../../../core/utils/formatter/data_formatter.dart';

// ignore: must_be_immutable
class SelectSeatScreen extends StatefulWidget {
  String? movieName;
  String? date;
  String? hallLocation;
  SelectSeatScreen({super.key,this.movieName,this.hallLocation,this.date});

  @override
  State<SelectSeatScreen> createState() => _SelectSeatScreenState();
}

class _SelectSeatScreenState extends State<SelectSeatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          children: [
            CustomAppBarWidget(
              title: "Select Seat",
              centerWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(widget.movieName!,style: AppTextStyle.medium.s18,overflow: TextOverflow.ellipsis,),
                  Text("${formatDate(widget.date)} ${widget.hallLocation}",style: AppTextStyle.medium.s12.copyWith(color: AppColors.lightBlueColor),overflow: TextOverflow.ellipsis,)
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(ImagePath.biggerMap),
                      ],
                    ),
                  ),
                  Container(
                    color: AppColors.whiteColor,
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                    child: Column(
                      children: [
                        _showSeatData(),
                        SizedBox(height: 30.h,),
                        Row(
                          children: [
                            Expanded(
                              flex:1,
                              child: _totalPriceWidget(),
                            ),
                            SizedBox(width: 10.w,),
                            Expanded(
                              flex:3,
                              child:  CustomButtonWidget(
                              title: "Proceed to pay",
                              background: AppColors.lightBlueColor,
                              onTap: (){
                              },
                            ),)
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _totalPriceWidget(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 52.h,
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Total Price",style: AppTextStyle.normal.s10,),
          Text("\$ 50",style: AppTextStyle.semiBold.s16,)
        ],
      ),
    );
  }

  _showSeatData(){
    return Column(
      children: [
        Row(
          children: [
            _singleTileWidget(
                title: "Selected",
                color: AppColors.goldColor
            ),
            SizedBox(width: 30.w,),
            _singleTileWidget(
                title: "Not available",
                color: AppColors.darkGreyColor
            ),
          ],
        ),
        SizedBox(height: 20.h,),
        Row(
          children: [
            _singleTileWidget(
                title: "VIP (150\$)",
                color: AppColors.purpleColor
            ),
            SizedBox(width: 30.w,),
            _singleTileWidget(
                title: "Regular (50 \$)",
                color: AppColors.lightBlueColor
            ),
          ],
        )
      ],
    );
  }

  _singleTileWidget({title, color}){
    return Row(
      children: [
        SvgPicture.asset(ImagePath.seat,colorFilter: ColorFilter.mode(color, BlendMode.srcIn)),
        SizedBox(width: 10.w,),
        Text(title,style: AppTextStyle.medium.s12.copyWith(color: AppColors.darkGreyColor),),
      ],
    );
  }
}
