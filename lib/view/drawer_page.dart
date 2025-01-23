import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:map/constant/color.dart';
import 'package:map/controllers/language_controller.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final LanguageController controller = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor(fontColor2).withOpacity(.3),
      child: Padding(
        padding: EdgeInsets.only(top: 60.h, left: 40.w, bottom: 70.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          textDirection: TextDirection.ltr,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                controller.getSettingText(context),
                textAlign: TextAlign.left,
                style: TextStyle(
                    letterSpacing: 1.3.w,
                    color: HexColor(fontColor),
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 100.h),

            Column(
              children: <Widget>[
                NewRow(
                  text: controller.getContactText(context),
                  icon: Icons.wechat_outlined,
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                        Padding(
                          padding: EdgeInsets.all(15.sp),
                          child: SizedBox(
                            height: 300.h,
                            child: ListView(
                              children: [
                                ListTile(
                                  onTap: () {
                                    Get.updateLocale(const Locale('ar'));
                                  },
                                  title: Text(
                                    'العربية',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: HexColor(fontColor)),
                                  ),
                                ),
                                Divider(
                                  color: HexColor(fontColor),
                                ),
                                ListTile(
                                  onTap: () {
                                    Get.updateLocale(const Locale('en'));
                                  },
                                  title: Text(
                                    'English',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: HexColor(fontColor)),
                                  ),
                                ),
                                Divider(
                                  color: HexColor(fontColor),
                                ),
                                ListTile(
                                  onTap: () {
                                    Get.updateLocale(const Locale('ja'));
                                  },
                                  title: Text(
                                    '日本語',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: HexColor(fontColor)),
                                  ),
                                ),
                                Divider(
                                  color: HexColor(fontColor),
                                ),
                                ListTile(
                                  onTap: () {
                                    Get.updateLocale(const Locale('zh'));
                                  },
                                  title: Text(
                                    '中文',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: HexColor(fontColor)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        backgroundColor: HexColor(backgroundColor));

                    // Get.updateLocale(Locale('ar'));
                  },
                  child: NewRow(
                    text: '${controller.getLanguageText(context)}',
                    icon: Icons.g_translate_sharp,
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                // NewRow(
                //   text: 'Messages',
                //   icon: Icons.chat_bubble_outline,
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // NewRow(
                //   text: 'Saved',
                //   icon: Icons.bookmark_border,
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // NewRow(
                //   text: 'Favorites',
                //   icon: Icons.favorite_border,
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // NewRow(
                //   text: 'Hint',
                //   icon: Icons.lightbulb_outline,
                // ),
                // SizedBox(
                //   height: 20,
                // ),
              ],
            ),
            const Spacer(),
            // Row(
            //   children: <Widget>[
            //     Icon(
            //       Icons.cancel,
            //       color: Colors.white.withOpacity(0.5),
            //     ),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     Text(
            //       'Log out',
            //       style: TextStyle(color: Colors.white.withOpacity(0.5)),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

class NewRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const NewRow({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      children: <Widget>[
        Icon(
          icon,
          color: HexColor(fontColor),
        ),
        SizedBox(
          width: 20.w,
        ),
        Text(
          text,
          style: TextStyle(color: HexColor(fontColor)),
        )
      ],
    );
  }
}
