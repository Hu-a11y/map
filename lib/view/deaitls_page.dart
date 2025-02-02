import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:map/constant/color.dart';
import 'package:map/constant/language.dart';
import 'package:map/controllers/language_controller.dart';
import 'package:map/main.dart';
import '../controllers/map_controller.dart';
import '../generated/l10n.dart';
import '../models/location_model.dart';

class DetailsPage extends StatelessWidget {

  final int index;

  DetailsPage({required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LanguageController(),
      builder: (controller) {
        controller.getAllLandmarks(context);
        String title = controller.landmarks![index].title;
        String subTitle = controller.landmarks![index].subtitle;
        String discription = controller.landmarks![index].description;
        String image = controller.landmarks![index].image;
        List<Widget> appBarIcons = [
          controller.isDrawerOpen
              ? GestureDetector(
                  child: Icon(
                    textDirection: TextDirection.ltr,
                    Icons.arrow_back_ios,
                    color: HexColor(fontColor),
                  ),
                  onTap: () {
                    controller.xOffset = 0;
                    controller.yOffset = 0;
                    controller.isDrawerOpen = false;
                    controller.update();
                  },
                )
              : GestureDetector(
                  onTap: () {
                    controller.xOffset = 290;
                    controller.yOffset = 80;
                    controller.isDrawerOpen = true;
                    controller.update();
                  },
                  child: SizedBox(
                      height: 14.h,
                      width: 26.w,
                      child: ClipRect(
                          child: Transform.flip(
                        flipX: true,
                        child:
                            SvgPicture.asset('assets/icons/Group 811678.svg'),
                      ))),
                ),
          const Spacer(),
          !controller.isSpeak
              ? GestureDetector(
                  onTap: () {
                    controller.speak(discription);
                  },
                  child: Transform.flip(
                    flipX: true,
                    child: Icon(
                      Icons.play_arrow,
                      size: 35.sp,
                      color: HexColor(fontColor2),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    controller.stopSpeak();
                  },
                  child: Transform.flip(
                    flipX: true,
                    child: Icon(
                      Icons.stop,
                      size: 35.sp,
                      color: HexColor(fontColor2),
                    ),
                  ),
                ),
        ];

        return AnimatedContainer(
          transform: Matrix4.translationValues(
              controller.xOffset, controller.yOffset, 0)
            ..scale(controller.isDrawerOpen ? 0.85 : 1.00)
            ..rotateZ(controller.isDrawerOpen ? -50 : 0),
          duration: Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: HexColor(backgroundColor),
            borderRadius: controller.isDrawerOpen
                ? BorderRadius.circular(40)
                : BorderRadius.circular(0),
          ),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: controller.isDrawerOpen
                    ? BorderRadius.circular(40)
                    : BorderRadius.circular(0),
                gradient: LinearGradient(
                  colors: [
                    HexColor(fontColor2).withOpacity(0.2),
                    HexColor(backgroundColor)
                  ],
                  begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                )),
            child: Padding(
              padding: EdgeInsets.only(right: 20.w, left: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 65.h),
                    Row(
                      textDirection: TextDirection.ltr,
                      children: appBarIcons.toList(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 52.26.h, right: 20.w, left: 20.w),
                      child: SizedBox(
                        width: 234.w,
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Helvetica'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.26.h, right: 20.w, left: 20.w),
                      child: SizedBox(
                        width: 234.w,
                        child: Text(
                          subTitle,
                          style: TextStyle(
                              color: HexColor(fontColor2),
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Helvetica'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 52.26.h, right: 20.w, left: 20.w),
                      child: SizedBox(
                        width: 234.w,
                        child: Text(
                          discription,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Helvetica'),
                        ),
                      ),
                    ),
                    SizedBox(height: 100.h),
                    SizedBox(
                      height: 250.h,
                      width: 250.w,
                      child: ClipRect(
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
