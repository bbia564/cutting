import 'package:cutting/db_xi/cutting_entity.dart';
import 'package:faker/faker.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class DBXi extends GetxService {
  late Database dbBase;
  final faker = Faker();

  Future<DBXi> init() async {
    await createCuttingDB();
    return this;
  }

  createCuttingDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'cutting.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await createCuttingTable(db);
      await _initData(db);
    });
  }

  createCuttingTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS cutting (id INTEGER PRIMARY KEY, created_time TEXT, mod_first INTEGER, mod_second INTEGER, mod_third INTEGER, materials_first TEXT, materials_second INTEGER, materials_third INTEGER)');
  }

  _initData(Database db) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('showNum', '1');
    await prefs.setString('unit', 'mm');
    for (int i = 0; i < 2; i++) {
      await db.insert('cutting', {
        'created_time': DateTime.now().subtract(Duration(hours: i*4)).toIso8601String(),
        'mod_first': 20,
        'mod_second': 30,
        'mod_third': 2,
        'materials_first':i == 0 ? 'Redwood' : 'Chinese fir',
        'materials_second': 200,
        'materials_third': 300,
      });
    }

  }

  updateCuttingData(CuttingEntity entity) async {
    await dbBase.update('cutting', {
      'created_time': entity.createdTime.toIso8601String(),
      'mod_first': entity.modFirst,
      'mod_second': entity.modSecond,
      'mod_third': entity.modThird,
      'materials_first': entity.materialsFirst,
      'materials_second': entity.materialsSecond,
      'materials_third': entity.materialsThird,
    },where: 'id = ?',whereArgs: [entity.id]);
  }

  cleanAllData() async {
    await dbBase.delete('cutting');
  }

  Future<List<CuttingEntity>> getAllData() async {
    var result = await dbBase.query('cutting', orderBy: 'created_time DESC');
    return result.map((e) => CuttingEntity.fromJson(e)).toList();
  }
}
