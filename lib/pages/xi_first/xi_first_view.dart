import 'package:cutting/main.dart';
import 'package:cutting/pages/xi_first/cutting_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'xi_first_logic.dart';

class XiFirstPage extends GetView<XiFirstLogic> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cutting record'),
        actions: [
          GestureDetector(
            child: Icon(
              Icons.add,
              size: 30,
              color: primaryColor,
            ).marginOnly(right: 20),
            onTap: () {
              Get.toNamed('/xiCuttingInput')?.then((_) {
                controller.getData();
              });
            },
          )
        ],
      ),
      body: Container(
        child: Obx(() {
          return controller.list.value.isEmpty
              ? const Center(
                  child: Text('No data'),
                )
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.list.value.length,
                  itemBuilder: (_, index) {
                    final entity = controller.list.value[index];
                    return GestureDetector(
                      child: CuttingItem(entity),
                      onTap: () {
                        Get.toNamed('/xiCuttingInput',
                                arguments: entity)
                            ?.then((_) {
                          controller.getData();
                        });
                      },
                    );
                  });
        }),
      )
          .decorated(
              color: Colors.white, borderRadius: BorderRadius.circular(10))
          .marginAll(12),
    );
  }
}
