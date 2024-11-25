import 'package:intl/intl.dart';

class CuttingEntity {
  int id;
  DateTime createdTime;
  int modFirst;
  int modSecond;
  int modThird;
  String materialsFirst;
  int materialsSecond;
  int materialsThird;

  CuttingEntity({
    required this.id,
    required this.createdTime,
    required this.modFirst,
    required this.modSecond,
    required this.modThird,
    required this.materialsFirst,
    required this.materialsSecond,
    required this.materialsThird,
  });

  factory CuttingEntity.fromJson(Map<String, dynamic> json) {
    return CuttingEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['created_time']),
      modFirst: json['mod_first'],
      modSecond: json['mod_second'],
      modThird: json['mod_third'],
      materialsFirst: json['materials_first'],
      materialsSecond: json['materials_second'],
      materialsThird: json['materials_third'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_time': createdTime.toIso8601String(),
      'mod_first': modFirst,
      'mod_second': modSecond,
      'mod_third': modThird,
      'materials_first': materialsFirst,
      'materials_second': materialsSecond,
      'materials_third': materialsThird,
    };
  }

  String get time {
    return DateFormat('yyyy/MM/dd HH:mm').format(createdTime);
  }
}
