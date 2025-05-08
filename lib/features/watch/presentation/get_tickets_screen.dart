import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sami_ahmed_tentwenty_assignment/core/constants/app_images.dart';

import '../../../components/custom_widgets/custom_app_bar_widget.dart';
import '../../../components/custom_widgets/custom_button_widget.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_fonts.dart';
import '../../../core/utils/formatter/data_formatter.dart';
import '../../../general_models/show_time_model.dart';
import '../../../routes/app_pages.dart';

// ignore: must_be_immutable
class GetTicketsScreen extends StatefulWidget {
  String? movieName;
  String? releaseDate;
  GetTicketsScreen({super.key,this.releaseDate,this.movieName});

  @override
  State<GetTicketsScreen> createState() => _GetTicketsScreenState();
}

class _GetTicketsScreenState extends State<GetTicketsScreen> {

  final DateTime startDate = DateTime.now();
  final int totalDays = 365 * 5;
  int selectedIndex = 0;
  String selectedDate =  DateTime.now().toString();
  int selectedMapIndex = 0;
  final DateFormat formatter = DateFormat('d MMM');

  List<ShowTime> dummyShowTimes = [
    ShowTime(
      time: "12:30",
      location: "Cinetech + Hall 1",
      price: "50",
      bonus: "2500",
    ),
    ShowTime(
      time: "13:30",
      location: "Cinetech + Hall 2",
      price: "75",
      bonus: "300",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          children: [
            CustomAppBarWidget(
              title: "Get Tickets",
              centerWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(widget.movieName!,style: AppTextStyle.medium.s18,overflow: TextOverflow.ellipsis,),
                  Text("In theaters ${formatDate(widget.releaseDate)}",style: AppTextStyle.medium.s12.copyWith(color: AppColors.lightBlueColor),overflow: TextOverflow.ellipsis,)
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 65.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Date",style: AppTextStyle.medium.s16,overflow: TextOverflow.ellipsis,),
                                SizedBox(height: 10.h,),
                                Expanded(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: totalDays,
                                    itemBuilder: (context, index) {
                                      final currentDate = startDate.add(Duration(days: index));
                                      final isSelected = selectedIndex == index;

                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedIndex = index;
                                            selectedDate = currentDate.toString();
                                          });
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 6),
                                          padding: EdgeInsets.symmetric(horizontal: 16.w,),
                                          decoration: BoxDecoration(
                                            color: isSelected ? Colors.blue : Colors.grey.shade200,
                                            borderRadius: BorderRadius.circular(10.r),
                                          ),
                                          child: Center(
                                            child: Text(
                                              formatter.format(currentDate),
                                              style: AppTextStyle.medium.s12.copyWith(color: isSelected?AppColors.whiteColor:AppColors.blackColor),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            )
                          ),
                          SizedBox(height: 30.h,),
                          SizedBox(
                              height: 210.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: dummyShowTimes.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedMapIndex = index;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10.w),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(dummyShowTimes[index].time,style: AppTextStyle.medium.s12,),
                                              SizedBox(width: 10.h,),
                                              Text(dummyShowTimes[index].location,style: AppTextStyle.normal.s12.copyWith(color: AppColors.darkGreyColor)),
                                            ],
                                          ),
                                          SizedBox(height: 10.h,),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.r),
                                              border: Border.all(color: selectedMapIndex==index?AppColors.lightBlueColor:AppColors.lightGreyColor)
                                            ),
                                            padding: EdgeInsets.symmetric(horizontal: 50.w,vertical: 20.h),
                                            child: Center(
                                              child: Image.asset(ImagePath.map),
                                            ),
                                          ),
                                          SizedBox(height: 10.h,),
                                          RichText(
                                            text: TextSpan(
                                              style: AppTextStyle.medium.s12, // Default style for the entire text
                                              children: <TextSpan>[
                                                TextSpan(text: 'From ',style: AppTextStyle.normal.s12),
                                                TextSpan(
                                                  text: '${dummyShowTimes[index].price}\$',
                                                    style: AppTextStyle.medium.s12
                                                ),
                                                TextSpan(text: ' or ',style: AppTextStyle.normal.s12),
                                                TextSpan(
                                                  text: dummyShowTimes[index].bonus,
                                                    style: AppTextStyle.medium.s12
                                                ),
                                                TextSpan(text: ' bonus',style: AppTextStyle.normal.s12),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                          ),

                        ],
                      ),
                    ),
                    CustomButtonWidget(
                      title: "Select Seats",
                      background: AppColors.lightBlueColor,
                      onTap: (){
                        context.pushNamed(Routes.selectSeat,
                            pathParameters: {
                              'movieName': widget.movieName!,
                              'date': selectedDate,
                              'hallLocation':dummyShowTimes[selectedMapIndex].location,
                            });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
