import 'package:cutting/pages/xi_cutting_input/xi_cutting_input_binding.dart';
import 'package:cutting/pages/xi_cutting_result/xi_cutting_result_binding.dart';
import 'package:cutting/pages/xi_first/xi_first_binding.dart';
import 'package:cutting/pages/xi_first/xi_first_view.dart';
import 'package:cutting/pages/xi_main/xi_main_binding.dart';
import 'package:cutting/pages/xi_main/xi_main_view.dart';
import 'package:cutting/pages/xi_second/xi_second_view.dart';
import 'package:cutting/router/router_titles.dart';
import 'package:get/get.dart';

import '../pages/xi_cutting_input/xi_cutting_input_view.dart';
import '../pages/xi_cutting_result/xi_cutting_result_view.dart';

class RouterPages {

  static pageBuilder({
    required String name,
    required GetPageBuilder page,
    Bindings? binding,
  }) {
    return GetPage(
      name: name,
      page: page,
      binding: binding,
      preventDuplicates: true,
      transition: Transition.cupertino,
      popGesture: true,
    );
  }


  static List<GetPage> list = [
    pageBuilder(name: RouterTitles.xiMain, page: () =>XiMainPage(),binding: XiMainBinding()),
    pageBuilder(name: RouterTitles.xiFirst, page: () =>XiFirstPage(),binding: XiFirstBinding()),
    pageBuilder(name: RouterTitles.xiSecond, page: () =>XiSecondPage(),binding: XiFirstBinding()),
    pageBuilder(name: RouterTitles.xiCuttingInput, page: () =>XiCuttingInputPage(),binding: XiCuttingInputBinding()),
    pageBuilder(name: RouterTitles.xiCuttingResult, page: () =>XiCuttingResultPage(),binding: XiCuttingResultBinding()),
  ];
}