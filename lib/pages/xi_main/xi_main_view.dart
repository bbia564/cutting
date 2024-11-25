import 'package:cutting/main.dart';
import 'package:cutting/pages/xi_first/xi_first_logic.dart';
import 'package:cutting/pages/xi_first/xi_first_view.dart';
import 'package:cutting/pages/xi_second/xi_second_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'xi_main_logic.dart';

class XiMainPage extends GetView<XiMainLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [XiFirstPage(), XiSecondPage()],
      ),
      bottomNavigationBar: Obx(() => _navBotBars()),
    );
  }

  Widget _navBotBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.folder_open_rounded,
            color: Colors.grey,
          ),
          activeIcon: Icon(
            Icons.folder_open_rounded,
            color: primaryColor,
          ),
          label: 'Cutting',
        ),
        BottomNavigationBarItem(
          icon:const Icon(Icons.settings, color: Colors.grey),
          activeIcon: Icon(
            Icons.settings,
            color: primaryColor,
          ),
          label: 'General',
        )
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
        if (index == 0) {
          XiFirstLogic firstLogic = Get.find<XiFirstLogic>();
          firstLogic.getData();
        }
      },
    );
  }
}
