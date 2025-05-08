import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sami_ahmed_tentwenty_assignment/core/constants/app_colors.dart';
import 'package:sami_ahmed_tentwenty_assignment/core/constants/app_images.dart';
import 'package:sami_ahmed_tentwenty_assignment/core/theme/app_fonts.dart';

import '../../../components/custom_widgets/custom_app_bar_widget.dart';
import '../../../core/utils/enums/state_type_enum.dart';
import '../../../routes/app_pages.dart';
import '../bloc/watch_bloc.dart';
import '../bloc/watch_event.dart';
import '../bloc/watch_state.dart';
import '../domain/entities/upcoming_movies.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({super.key});

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {

  bool? isSearch = false;
  late FocusNode _searchFocusNode;
  bool _showTopResultsWidget = true;
  var matchedResults;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WatchBloc>().add(
      GetUpcomingMovies(),
    );
    _searchFocusNode = FocusNode();
    _searchFocusNode.addListener(() {
      if (!_searchFocusNode.hasFocus) {
        setState(() {
          _showTopResultsWidget = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isSearch!?!_showTopResultsWidget?CustomAppBarWidget(
          title: "${matchedResults.length} Results Found",
          onTapBackButton: (){
            setState(() {
              searchController.clear();
              _showTopResultsWidget = true;
              isSearch = false;
            });
          },
        ):_searchWidget():CustomAppBarWidget(
          title: "Watch",
          trailingIcon: ImagePath.search,
          hideBackButton: true,
          onTapTrailingButton: (){
            setState(() {
              isSearch = true;
            });
          },
        ),
        _bodyWidget(),
      ],
    );
  }

  _bodyWidget(){
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: BlocBuilder<WatchBloc, WatchState>(
          builder: (BuildContext context, state) {
            return state.upcomingMovies==null || state.stateType==StateType.loading?
            const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),):
            isSearch!?_searchedMovieListViewWidget(state.upcomingMovies):_upcomingMoviesListViewWidget(state);
          },
        ),
      ),
    );
  }

  _upcomingMoviesListViewWidget(state){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: state.upcomingMovies!.results.length,
      itemBuilder: (context,index){
        return InkWell(
          onTap: (){
            context.pushNamed(Routes.movieDetail,extra: state.upcomingMovies!.results[index].id);
          },
          child: Container(
            height: 180.h,
            margin: EdgeInsets.only(bottom: 10.h,top: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
            decoration: BoxDecoration(
                color: AppColors.lightGreyColor,
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                  image: NetworkImage('https://image.tmdb.org/t/p/w500${state.upcomingMovies!.results[index].posterPath}'),
                  fit: BoxFit.cover,
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(state.upcomingMovies!.results[index].originalTitle!,style: AppTextStyle.medium.s18.copyWith(color: AppColors.whiteColor),)
              ],
            ),
          ),
        );
      },
    );
  }

  _searchWidget(){
    return Container(
      height: 66.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      color: AppColors.whiteColor,
      child: Center(
        child: Container(
          height: 52.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: AppColors.greyColor
          ),
          child: Row(
            children: [
              SvgPicture.asset(ImagePath.search),
              SizedBox(width: 10.w,),
              Expanded(
                child: TextField(
                  focusNode: _searchFocusNode,
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {
                      searchController.text = value;
                    });
                  },
                  onSubmitted: (_) {
                    FocusScope.of(context).unfocus(); // This will trigger the listener
                  },
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: 'TV shows, movies and more',
                    hintStyle: TextStyle(color: Colors.black45),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(width: 10.w,),
              InkWell(
                onTap: (){
                  setState(() {
                    isSearch = false;
                  });
                },
                  child: SvgPicture.asset(ImagePath.close)),
            ],
          ),
        ),
      ),
    );
  }

  _searchedMovieListViewWidget(UpcomingMovies ?upcomingMovies){

    matchedResults = upcomingMovies!.results.where((result)=>result.originalTitle!.toLowerCase().contains(searchController.text)).toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _showTopResultsWidget ?_topResultTextWidget():Offstage(),
        Expanded(
          child: matchedResults.isEmpty
              ? Center(child: Text("No results found", style: AppTextStyle.normal.s14))
              : ListView.builder(
            shrinkWrap: true,
            itemCount: matchedResults.length,
            itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  context.pushNamed(Routes.movieDetail,extra: matchedResults[index].id);
                },
                child: Row(
                  children: [
                    Container(
                      height: 100.h,
                      width: 130.w,
                      margin: EdgeInsets.only(bottom: 10.h,top: 10.h),
                      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                      decoration: BoxDecoration(
                          color: AppColors.lightGreyColor,
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(
                            image: NetworkImage('https://image.tmdb.org/t/p/w500${matchedResults[index].posterPath}'),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    SizedBox(width: 16.w,),
                    Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(matchedResults[index].originalTitle!,style: AppTextStyle.medium.s14,),
                            Row(
                              children: [
                                Icon(Icons.star,color: AppColors.goldColor,),
                                Text(matchedResults[index].voteAverage!.toString(),style: AppTextStyle.normal.s12,),
                              ],
                            ),
                          ],
                    )),
                    SizedBox(width: 16.w,),
                    SvgPicture.asset(ImagePath.menu),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  _topResultTextWidget(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h,),
        Text("Top Results",style: AppTextStyle.normal.s12,),
        Divider(),
      ],
    );
  }
}
