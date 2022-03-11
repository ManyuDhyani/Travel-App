import 'package:flutter/material.dart';
import 'package:travel_app/Widgets/appButton.dart';
import 'package:travel_app/Widgets/appLargeText.dart';
import 'package:travel_app/Widgets/appText.dart';
import 'package:travel_app/Widgets/responsiveButton.dart';
import 'package:travel_app/misc/colors.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int ratings = 4;
  int selectedButtonIndex = -1;

  @override
  Widget build(BuildContext context) {
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
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/mountain.jpeg"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              left: 20.0,
              top: 40.0,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Positioned(
              top: 310,
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
                          text: "Devkayara",
                          color: Colors.black.withOpacity(0.8),
                        ),
                        AppLargeText(
                          text: "₹ 9500",
                          color: AppColors.mainColor,
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
                          text: "Uttarkashi, Uttarakhand",
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
                          text: "(4.0)",
                          color: AppColors.textColor2,
                        ),
                      ],
                    ),
                    const SizedBox(height: 25.0),
                    AppLargeText(
                      text: "People",
                      color: Colors.black.withOpacity(0.8),
                      size: 20.0,
                    ),
                    const SizedBox(height: 5.0),
                    AppText(
                      text: "Number of people in your group",
                      color: AppColors.mainTextColor,
                    ),
                    const SizedBox(height: 10.0),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedButtonIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: AppButton(
                              color: selectedButtonIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: selectedButtonIndex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              size: 50.0,
                              borderColor: selectedButtonIndex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 20.0),
                    AppLargeText(
                      text: "Description",
                      color: Colors.black.withOpacity(0.8),
                      size: 20.0,
                    ),
                    const SizedBox(height: 10.0),
                    AppText(
                      text:
                          "Devkyara is a high altitude bugyal and one of the very less explored trails in the countryside. Possessing all you can expect from a high altitude Himalayan trek, it is also a sacred place for the people of the nearby villages.",
                      color: AppColors.mainTextColor,
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
  }
}
