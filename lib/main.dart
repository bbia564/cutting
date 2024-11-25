import 'package:cutting/db_xi/db_xi.dart';
import 'package:cutting/pages/xi_cutting_input/xi_cutting_input_binding.dart';
import 'package:cutting/pages/xi_cutting_input/xi_cutting_input_view.dart';
import 'package:cutting/pages/xi_cutting_result/xi_cutting_result_binding.dart';
import 'package:cutting/pages/xi_cutting_result/xi_cutting_result_view.dart';
import 'package:cutting/pages/xi_first/xi_first_binding.dart';
import 'package:cutting/pages/xi_first/xi_first_view.dart';
import 'package:cutting/pages/xi_main/xi_main_binding.dart';
import 'package:cutting/pages/xi_main/xi_main_view.dart';
import 'package:cutting/pages/xi_second/xi_second_binding.dart';
import 'package:cutting/pages/xi_second/xi_second_view.dart';
import 'package:cutting/pages/xi_way/xi_way_binding.dart';
import 'package:cutting/pages/xi_way/xi_way_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'db_xi/xi_real.dart';

Color primaryColor = const Color(0xff6f3cff);
Color bgColor = const Color(0xfff4f3f9);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBXi().init());
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Hill,
      initialRoute: '/xi',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Hill = [
  GetPage(name: '/xi', page: () => const XiWayView(),binding: XiWayBinding()),
  GetPage(name: '/xiMain', page: () => XiMainPage(),binding: XiMainBinding()),
  GetPage(name: '/xiWay', page: () => const XiReal()),
  GetPage(name: '/xiFirst', page: () => XiFirstPage(),binding: XiFirstBinding()),
  GetPage(name: '/xiSecond', page: () => XiSecondPage(),binding: XiSecondBinding()),
  GetPage(name: '/xiCuttingInput', page: () => XiCuttingInputPage(),binding: XiCuttingInputBinding()),
  GetPage(name: '/xiCuttingResult', page: () => XiCuttingResultPage(),binding: XiCuttingResultBinding()),
];
