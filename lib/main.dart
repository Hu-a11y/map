import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:location/location.dart';
import 'package:map/constant/color.dart';
import 'package:map/constant/language.dart';
import '../services/location_service.dart';
import '../view/deaitls_page.dart';

import 'generated/l10n.dart';
import 'models/location_model.dart';
import 'view/drawer_page.dart';
import 'view/map_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          // locale: Locale(languageChosen['code']),

          locale: Locale('en'),
          fallbackLocale: const Locale(
            'en',
          ), // اللغة الافتراضية في حالة عدم التوفر
          debugShowCheckedModeBanner: false,
          title: 'First Method',

          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(
                fontSizeFactor: 1.sp,

                // bodyColor: Colors.black,
                fontFamily: languageChosen['fontFamily']),
          ),
          home: child,
        );
      },
      child: MapPage(),
      //     Scaffold(
      //   backgroundColor: HexColor(backgroundColor),
      //   body: Stack(
      //     children: [
      //       DrawerScreen(),
      //       DetailsPage(
      //         location: LocationModel(
      //           latitude: 32.363473,
      //           longitude: 44.549068,
      //           name: "الموقع 3",
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: 
//     );
//   }
// }
