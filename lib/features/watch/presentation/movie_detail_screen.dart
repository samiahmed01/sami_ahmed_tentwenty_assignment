import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sami_ahmed_tentwenty_assignment/components/custom_widgets/custom_button_widget.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/theme/app_fonts.dart';
import '../../../core/utils/enums/state_type_enum.dart';
import '../../../core/utils/formatter/data_formatter.dart';
import '../../../routes/app_pages.dart';
import '../bloc/watch_bloc.dart';
import '../bloc/watch_event.dart';
import '../bloc/watch_state.dart';
import '../domain/entities/movie_detail.dart';

// ignore: must_be_immutable
class MovieDetailScreen extends StatefulWidget {
  int? movieId;
  MovieDetailScreen({super.key,this.movieId});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {

  final List<Color> chipColors = [
    AppColors.greenColor,
    AppColors.pickColor,
    AppColors.purpleColor,
    AppColors.goldColor,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WatchBloc>().add(
      GetMovieDetail(movieId: widget.movieId!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocBuilder<WatchBloc, WatchState>(
        builder: (BuildContext context, state) {
          return state.movieDetail==null || state.stateType==StateType.loading?
          const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),):
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Image.network('https://image.tmdb.org/t/p/w500${state.movieDetail!.posterPath!}',
                            fit: BoxFit.cover,
                          )
                      ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.7), // Dark at the bottom
                              Colors.transparent,            // Transparent at the top
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40.h,
                        left: 16.w,
                        child: Row(
                          children: [
                            InkWell(
                                onTap: (){
                                  context.pop();
                                },
                                child: SvgPicture.asset(ImagePath.back,colorFilter: ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn))
                            ),
                            SizedBox(width: 10.w,),
                            Text("Watch",style: AppTextStyle.medium.s16.copyWith(color: AppColors.whiteColor),),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 16.h,
                        left: 16.w,
                        right: 16.w,
                        child: Column(
                          children: [
                            Text("In theaters ${formatDate(state.movieDetail!.releaseDate.toString())}",style: AppTextStyle.medium.s16.copyWith(color: AppColors.whiteColor),),
                            SizedBox(height: 15.h,),
                            CustomButtonWidget(
                              title: "Get Tickets",
                              background: AppColors.lightBlueColor,
                              onTap: (){
                                context.pushNamed(Routes.getTickets ,
                                    pathParameters: {
                                      'movieName': state.movieDetail!.title.toString(),
                                      'releaseDate':state.movieDetail!.releaseDate.toString(),
                                    });
                              },
                            ),
                            SizedBox(height: 10.h,),
                            CustomButtonWidget(
                              icon: Icons.play_arrow,
                              title: "Watch Trailer",
                              onTap: (){
                                context.pushNamed(Routes.videoPlayer,extra: state.movieDetail!.videos!.results);
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _genresWidget(state.movieDetail!.genres),
                          SizedBox(height: 10.h,),
                          _overViewWidget(state.movieDetail!.overview),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  _genresWidget(List<Genre> genres){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Genres",style: AppTextStyle.medium.s16,),
        SizedBox(height: 12.h,),
        Wrap(
          spacing: 10.0,
          runSpacing: 0.0,
          children: List.generate(genres.length, (index) {
            final color = chipColors[index % chipColors.length]; // Cycle through colors
            return Chip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              backgroundColor: color,
              label: Text(
                genres[index].name!,
                style: TextStyle(color: Colors.white),
              ),
            );
          }),
        )
      ],
    );
  }

  _overViewWidget(String? overview){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Overview",style: AppTextStyle.medium.s16,),
        SizedBox(height: 12.h,),
        Text(overview!,style: AppTextStyle.normal.s12.copyWith(color: AppColors.darkGreyColor),),
      ],
    );
  }
}
