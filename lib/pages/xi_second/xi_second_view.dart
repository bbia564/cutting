import 'dart:math';

import 'package:cutting/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'xi_second_logic.dart';

class XiSecondPage extends GetView<XiSecondLogic> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('General setting')),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: GetBuilder<XiSecondLogic>(
          init: XiSecondLogic(),
          builder: (logic) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 12),
                  width: double.infinity,
                  child: <Widget>[
                    GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                        height: 40,
                        child: <Widget>[
                          const Text(
                            'Unit',
                            style: TextStyle(fontSize: 14),
                          ),
                          <Widget>[
                            Text(
                              logic.unit,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.keyboard_arrow_right_outlined,
                              size: 20,
                              color: Colors.grey.withOpacity(0.7),
                            )
                          ].toRow(mainAxisAlignment: MainAxisAlignment.end)
                        ].toRow(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween),
                      ),
                      onTap: () {
                        logic.unitPicker(context);
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                        height: 40,
                        child: <Widget>[
                          const Text(
                            'Error',
                            style: TextStyle(fontSize: 14),
                          ),
                          <Widget>[
                            Text(
                              '${logic.showNum}%',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.keyboard_arrow_right_outlined,
                              size: 20,
                              color: Colors.grey.withOpacity(0.7),
                            )
                          ].toRow(mainAxisAlignment: MainAxisAlignment.end)
                        ].toRow(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween),
                      ),
                      onTap: () {
                        controller.editShowNum();
                      },
                    )
                  ].toColumn(
                      separator: Divider(
                        height: 15,
                        color: Colors.grey.withOpacity(0.3),
                      )),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 12),
                  width: double.infinity,
                  child: <Widget>[
                    GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                        height: 40,
                        child: <Widget>[
                          <Widget>[
                            Icon(
                              Icons.refresh,
                              size: 20,
                              color: primaryColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Restore',
                              style: TextStyle(
                                  fontSize: 14, color: primaryColor),
                            )
                          ].toRow(),
                          Icon(
                            Icons.keyboard_arrow_right_outlined,
                            size: 20,
                            color: Colors.grey.withOpacity(0.7),
                          )
                        ].toRow(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween),
                      ),
                      onTap: () {
                        controller.cleanAllSetting();
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                        height: 40,
                        child: <Widget>[
                          <Widget>[
                            const Icon(
                              Icons.info,
                              size: 20,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'About US',
                              style: TextStyle(fontSize: 14),
                            )
                          ].toRow(),
                          Icon(
                            Icons.keyboard_arrow_right_outlined,
                            size: 20,
                            color: Colors.grey.withOpacity(0.7),
                          )
                        ].toRow(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween),
                      ),
                      onTap: () {
                        controller.aboutUS(context);
                      },
                    )
                  ].toColumn(
                      separator: Divider(
                        height: 15,
                        color: Colors.grey.withOpacity(0.3),
                      )),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
              ].toColumn(),
            );
          },
        ).marginAll(12),
      ),
    );
  }
}
