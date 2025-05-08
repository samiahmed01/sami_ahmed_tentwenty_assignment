import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:sami_ahmed_tentwenty_assignment/core/constants/app_colors.dart';
import 'package:sami_ahmed_tentwenty_assignment/core/constants/app_images.dart';
import 'package:sami_ahmed_tentwenty_assignment/core/theme/app_fonts.dart';

import '../../watch/presentation/watch_screen.dart';

class DashboardScreen extends StatefulWidget {

  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int _currentIndex = 1;

  final PersistentTabController _controller = PersistentTabController(initialIndex: 1);

  List<Widget> _buildScreens() {
    return [
      Center(child: Text("Dashboard")),
      WatchScreen(),
      Center(child: Text("Media Library")),
      Center(child: Text("More")),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      _singleNavBarItem(
        icon: ImagePath.dashboard,
        title: "Dashboard",
        index: 0,
      ),
      _singleNavBarItem(
        icon: ImagePath.watch,
        title: "Watch",
        index: 1,
      ),
      _singleNavBarItem(
        icon: ImagePath.mediaLibrary,
        title: "Media Library",
        index: 2,
      ),
      _singleNavBarItem(
        icon: ImagePath.more,
        title: "More",
        index: 3,
      ),
    ];
  }

  _singleNavBarItem({icon, title,index}){
    return PersistentBottomNavBarItem(
      icon: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon,colorFilter: ColorFilter.mode(_currentIndex==index?AppColors.whiteColor:AppColors.darkGreyColor, BlendMode.srcIn),),
            SizedBox(height: 8.h),
            Text(title, style: AppTextStyle.normal.s10.copyWith(color: _currentIndex==index?AppColors.whiteColor:AppColors.darkGreyColor)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: PersistentTabView(
          navBarHeight: 75.h,
          backgroundColor: AppColors.primaryColor,
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          onItemSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(27.r),topRight: Radius.circular(27.r)),
            colorBehindNavBar: AppColors.backgroundColor
          ),
          navBarStyle: NavBarStyle.simple,
        ),
      ),
    );
  }
}
