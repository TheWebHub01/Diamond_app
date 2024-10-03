import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final helper = DbHelper._();

  DbHelper._();

  Database? database;

  Future<Database?> checkDB() async {
    if (database != null) {
      return database;
    } else {
      return await initDB();
    }
  }

  Future<Future<Database>> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "jewellers.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE diamonds (id INTEGER PRIMARY KEY AUTOINCREMENT,stage TEXT,images TEXT,imName TEXT,color TEXT,clarity TEXT,finish TEXT,cut TEXT,symmetry TEXT,location TEXT,certi_no TEXT,shades TEXT,handA TEXT,price REAL,tab REAL,depth REAL,lengh REAL,width REAL,ratio REAL,crown REAL,height REAL,crown_angle REAL,pav_depth REAL,pav_angle REAL,lab TEXT)";
        db.execute(query).then(
          (value) {
            log("Table Create Successfully");
          },
        );
      },
    );
  }

  void insertData({
    required stage,
    required images,
    required imName,
    required color,
    required clarity,
    required finish,
    required cut,
    required symmetry,
    required location,
    required certiNo,
    required shades,
    required handA,
    required price,
    required tab,
    required depth,
    required lengh,
    required width,
    required ratio,
    required crown,
    required height,
    required crownAngle,
    required pavDepth,
    required pavAngle,
    required lab,
  }) async {
    database = await checkDB();
    database!.insert(
      "diamonds",
      {
        "Stage": stage,
        "images": images,
        "imName":imName,
        "Color": color,
        "Clarity": clarity,
        "Finish": finish,
        "Cut": cut,
        "Symmetry": symmetry,
        "Location": location,
        "Certi_no": certiNo,
        "Shades": shades,
        "HandA": handA,
        "Price": price,
        "tab": tab,
        "Depth": depth,
        "Lengh": lengh,
        "Width": width,
        "Ratio": ratio,
        "Crown": crown,
        "Height": height,
        "Crown_Angle": crownAngle,
        "Pav_depth": pavDepth,
        "Pav_Angle": pavAngle,
        "Lab": lab,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, Object?>>> getShapes() async {
    database = await checkDB();
    return await database!.query("diamonds");
  }

  Future<List<Map>> readData() async {
    database = await checkDB();
    String query = "SELECT * FROM diamonds";
    List<Map> list = await database!.rawQuery(query);
    return list;
  }

  Future<void> deleteData({required id}) async {
    database = await checkDB();
    database!.delete("diamonds", where: "id=?", whereArgs: [id]);
  }
}
