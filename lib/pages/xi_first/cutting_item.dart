import 'package:cutting/db_xi/cutting_entity.dart';
import 'package:cutting/main.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class CuttingItem extends StatelessWidget {
  const CuttingItem(this.entity,{Key? key}) : super(key: key);

  final CuttingEntity entity;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
      child: <Widget>[
        <Widget>[
          Icon(
            Icons.folder_open_rounded,
            size: 40,
            color: primaryColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: <Widget>[
            Text(
              entity.materialsFirst,
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              entity.time,
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            )
          ].toColumn(crossAxisAlignment: CrossAxisAlignment.start)),
          Icon(
            Icons.keyboard_arrow_right_outlined,
            size: 20,
            color: Colors.grey.withOpacity(0.4),
          )
        ].toRow(),
        Divider(
          height: 15,
          color: Colors.grey.withOpacity(0.3),
        )
      ].toColumn(),
    );
  }
}
