import 'package:cutting/main.dart';
import 'package:cutting/pages/xi_second/cutting_input.dart';
import 'package:cutting/router/router_titles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'xi_cutting_input_logic.dart';

class XiCuttingInputPage extends GetView<XiCuttingInputLogic> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculated utilization rate'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<XiCuttingInputLogic>(builder: (_) {
          return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                const Text(
                  'Mod',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ).marginOnly(left: 12, bottom: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    <Widget>[
                      const Text(
                        'Length',
                        style: TextStyle(fontSize: 14),
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 40,
                        child: CuttingInput(
                            textStyle:
                                TextStyle(fontSize: 14, color: primaryColor),
                            isInteger: true,
                            maxLength: 8,
                            textAlign: TextAlign.end,
                            hintText: 'Input digit',
                            value: controller.entity?.modFirst == 0
                                ? ''
                                : (controller.entity?.modFirst.toString() ??
                                    ''),
                            onChange: (value) {
                              if (value.isEmpty) {
                                controller.entity?.modFirst = 0;
                              } else {
                                controller.entity?.modFirst =
                                    int.tryParse(value) ?? 0;
                              }
                            }),
                      ).marginSymmetric(horizontal: 8)),
                      Text(
                        controller.unit,
                        style: const TextStyle(fontSize: 14),
                      )
                    ].toRow(),
                    <Widget>[
                      const Text(
                        'Breadth',
                        style: TextStyle(fontSize: 14),
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 40,
                        child: CuttingInput(
                            textStyle:
                                TextStyle(fontSize: 14, color: primaryColor),
                            isInteger: true,
                            maxLength: 8,
                            textAlign: TextAlign.end,
                            hintText: 'Input digit',
                            value: controller.entity?.modSecond == 0
                                ? ''
                                : (controller.entity?.modSecond.toString() ??
                                ''),
                            onChange: (value) {
                              if (value.isEmpty) {
                                controller.entity?.modSecond = 0;
                              } else {
                                controller.entity?.modSecond =
                                    int.tryParse(value) ?? 0;
                              }
                            }),
                      ).marginSymmetric(horizontal: 8)),
                      Text(
                        controller.unit,
                        style: const TextStyle(fontSize: 14),
                      )
                    ].toRow(),
                    <Widget>[
                      const Text(
                        'Quantity',
                        style: TextStyle(fontSize: 14),
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 40,
                        child: CuttingInput(
                            padding: EdgeInsets.zero,
                            textStyle:
                                TextStyle(fontSize: 14, color: primaryColor),
                            isInteger: true,
                            maxLength: 8,
                            textAlign: TextAlign.end,
                            hintText: 'Input digit',
                            value: controller.entity?.modThird == 0
                                ? ''
                                : (controller.entity?.modThird.toString() ??
                                ''),
                            onChange: (value) {
                              if (value.isEmpty) {
                                controller.entity?.modThird = 0;
                              } else {
                                controller.entity?.modThird =
                                    int.tryParse(value) ?? 0;
                              }
                            }),
                      ).marginOnly(left: 8))
                    ].toRow()
                  ].toColumn(
                      separator: Divider(
                    height: 15,
                    color: Colors.grey.withOpacity(0.3),
                  )),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                const Text(
                  'Materials',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ).marginOnly(left: 12, bottom: 8, top: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    <Widget>[
                      const Text(
                        'Name',
                        style: TextStyle(fontSize: 14),
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 40,
                        child: CuttingInput(
                            padding: EdgeInsets.zero,
                            textStyle:
                                TextStyle(fontSize: 14, color: primaryColor),
                            maxLength: 15,
                            textAlign: TextAlign.end,
                            hintText: 'Enter name',
                            value: controller.entity?.materialsFirst ?? '',
                            onChange: (value) {
                              controller.entity?.materialsFirst = value;
                            }),
                      ).marginOnly(left: 8))
                    ].toRow(),
                    <Widget>[
                      const Text(
                        'Length',
                        style: TextStyle(fontSize: 14),
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 40,
                        child: CuttingInput(
                            textStyle:
                                TextStyle(fontSize: 14, color: primaryColor),
                            isInteger: true,
                            maxLength: 8,
                            textAlign: TextAlign.end,
                            hintText: 'Input digit',
                            value: controller.entity?.materialsSecond == 0
                                ? ''
                                : (controller.entity?.materialsSecond.toString() ??
                                ''),
                            onChange: (value) {
                              if (value.isEmpty) {
                                controller.entity?.materialsSecond = 0;
                              } else {
                                controller.entity?.materialsSecond =
                                    int.tryParse(value) ?? 0;
                              }
                            }),
                      ).marginSymmetric(horizontal: 8)),
                      Text(
                        controller.unit,
                        style: const TextStyle(fontSize: 14),
                      )
                    ].toRow(),
                    <Widget>[
                      const Text(
                        'Breadth',
                        style: TextStyle(fontSize: 14),
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 40,
                        child: CuttingInput(
                            textStyle:
                                TextStyle(fontSize: 14, color: primaryColor),
                            isInteger: true,
                            maxLength: 8,
                            textAlign: TextAlign.end,
                            hintText: 'Input digit',
                            value: controller.entity?.materialsThird == 0
                                ? ''
                                : (controller.entity?.materialsThird.toString() ??
                                ''),
                            onChange: (value) {
                              if (value.isEmpty) {
                                controller.entity?.materialsThird = 0;
                              } else {
                                controller.entity?.materialsThird =
                                    int.tryParse(value) ?? 0;
                              }
                            }),
                      ).marginSymmetric(horizontal: 8)),
                      Text(
                        controller.unit,
                        style: const TextStyle(fontSize: 14),
                      )
                    ].toRow()
                  ].toColumn(
                      separator: Divider(
                    height: 15,
                    color: Colors.grey.withOpacity(0.3),
                  )),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 50,
                    child: const Text(
                      'Start calculation',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                      .decorated(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12))
                      .marginOnly(top: 20),
                  onTap: () {
                    controller.startCount();
                  },
                )
              ].toColumn(crossAxisAlignment: CrossAxisAlignment.start));
        }).marginAll(12)),
      ),
    );
  }
}
