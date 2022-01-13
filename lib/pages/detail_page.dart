import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/cubit/app_cubit.dart';
import 'package:flutter_mastery/cubit/app_cubit_state.dart';
import 'package:flutter_mastery/misc/colors.dart';
import 'package:flutter_mastery/widgets/app_buttons.dart';
import 'package:flutter_mastery/widgets/app_large_text.dart';
import 'package:flutter_mastery/widgets/app_text.dart';
import 'package:flutter_mastery/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubicStates>(builder: (context, state) {
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
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'http://mark.bslmeiyu.com/uploads/' +
                                  detail.place.img),
                          fit: BoxFit.cover),
                    ),
                  )),
              Positioned(
                left: 20,
                top: 70,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                top: 70,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.info),
                      onPressed: () {},
                      color: Colors.white,
                    ),
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
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: detail.place.name,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          AppLargeText(
                            text: "\$" + detail.place.price.toString(),
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          AppText(
                            text: detail.place.location,
                            color: AppColors.textColor1,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: detail.place.stars > index
                                    ? AppColors.starColor
                                    : AppColors.textColor2,
                              );
                            }),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          AppText(
                            text: "(5.0)",
                            color: AppColors.textColor2,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          AppLargeText(
                            text: "People",
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          AppText(
                            text: "Number of people on your group",
                            color: AppColors.mainTextColor,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: AppButtons(
                                    size: 50,
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    backgroundColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    borderColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    text: (index + 1).toString(),
                                    isIcon: false,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          AppLargeText(
                            text: "Description",
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AppText(
                        color: AppColors.mainTextColor,
                        text: detail.place.description,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButtons(
                        size: 60,
                        color: AppColors.textColor1,
                        backgroundColor: Colors.white,
                        borderColor: AppColors.textColor2,
                        isIcon: true,
                        icon: Icons.favorite_border,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ResponsiveButton(
                        isResponsive: true,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      );
    });
  }
}
