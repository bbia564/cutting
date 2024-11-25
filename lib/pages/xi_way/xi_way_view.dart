import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'xi_way_logic.dart';

class XiWayView extends GetView<PageLogic> {
  const XiWayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.hackett.value
              ? const CircularProgressIndicator(color: Colors.deepPurpleAccent)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.zqsdjlc();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
