import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:travel_app/Widgets/appButton.dart';
import 'package:travel_app/Widgets/appLargeText.dart';
import 'package:travel_app/Widgets/appText.dart';
import 'package:travel_app/Widgets/responsiveButton.dart';
import 'package:travel_app/cubit/AppCubitStates.dart';
import 'package:travel_app/cubit/AppCubites.dart';
import 'package:travel_app/misc/colors.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  var images = {
    "altitude.png": "Altitude",
    "calender.png": "Duration",
    "difficulty.jpg": "Difficulty",
    "distance.jpg": "Distance",
  };

  int ratings = 4;
  int selectedButtonIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 340,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "http://mark.bslmeiyu.com/uploads/" +
                                detail.activity.thumbnail),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                left: 10.0,
                top: 40.0,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Positioned(
                top: 320,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: detail.activity.name,
                            color: Colors.black.withOpacity(0.8),
                            size: 28.0,
                          ),
                          AppLargeText(
                            text: "₹ " + detail.activity.price.toString(),
                            color: AppColors.mainColor,
                            size: 26.0,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                          ),
                          const SizedBox(width: 5.0),
                          AppText(
                            text: detail.activity.location,
                            color: AppColors.textColor1,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: index < ratings
                                    ? AppColors.starColor
                                    : AppColors.textColor2,
                              );
                            }),
                          ),
                          const SizedBox(width: 10.0),
                          AppText(
                            text: "(" +
                                detail.activity.ratings.toString() +
                                ".0)",
                            color: AppColors.textColor2,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        height: 90,
                        width: double.maxFinite,
                        child: ListView.builder(
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return Container(
                                margin: const EdgeInsets.only(right: 30.0),
                                child: Column(children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: AssetImage("img/" +
                                            images.keys.elementAt(index)),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Container(
                                    child: AppText(
                                      text: images.values.elementAt(index),
                                      color: AppColors.textColor2,
                                    ),
                                  )
                                ]),
                              );
                            }),
                      ),
                      const SizedBox(height: 10.0),
                      AppLargeText(
                        text: "Description",
                        color: Colors.black.withOpacity(0.8),
                        size: 20.0,
                      ),
                      const SizedBox(height: 10.0),
                      SingleChildScrollView(
                        child: Container(
                          child: ReadMoreText(
                            detail.activity.description,
                            trimLines: 2,
                            textAlign: TextAlign.justify,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: " Show More ",
                            trimExpandedText: " Show Less ",
                            lessStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.mainTextColor,
                            ),
                            moreStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.mainTextColor,
                            ),
                            style: TextStyle(
                              fontSize: 12.0,
                              height: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                right: 20.0,
                child: Row(
                  children: [
                    AppButton(
                      color: AppColors.textColor1,
                      backgroundColor: Colors.white,
                      size: 60.0,
                      borderColor: AppColors.textColor1,
                      isIcon: true,
                      icon: Icons.favorite_border,
                    ),
                    const SizedBox(width: 20.0),
                    ResponsiveButton(
                      isResponsive: true,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
