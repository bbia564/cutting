import 'package:cutting/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'xi_cutting_result_logic.dart';

class XiCuttingResultPage extends GetView<XiCuttingResultLogic> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('Calculation result'), backgroundColor: Colors.white),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<XiCuttingResultLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: <Widget>[
                Text(
                  controller.entity?.name ?? '',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ).marginOnly(bottom: 10),
                Container(
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    <Widget>[
                      Text(
                        'Board',
                        style: TextStyle(
                            fontSize: 14, color: Colors.black.withOpacity(0.6)),
                      ),
                      Text(
                        controller.entity?.resultFirst ?? '',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ].toRow(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    <Widget>[
                      Text(
                        'Quantity',
                        style: TextStyle(
                            fontSize: 14, color: Colors.black.withOpacity(0.6)),
                      ),
                      Text(
                        controller.entity?.resultSecond ?? '',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ].toRow(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    <Widget>[
                      Text(
                        'Utilization rate',
                        style: TextStyle(
                            fontSize: 14,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        controller.entity?.resultThird ?? '',
                        style: TextStyle(
                            fontSize: 14,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      )
                    ].toRow(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    <Widget>[
                      Text(
                        'Surplus',
                        style: TextStyle(
                            fontSize: 14,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        controller.entity?.resultFourth ?? '',
                        style: TextStyle(
                            fontSize: 14,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      )
                    ].toRow(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    )
                  ].toColumn(
                      separator: Divider(
                    height: 15,
                    color: Colors.grey.withOpacity(0.3),
                  )),
                ).decorated(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12))
              ].toColumn(),
            ).decorated(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
          );
        }).marginAll(12)),
      ),
    );
  }
}
