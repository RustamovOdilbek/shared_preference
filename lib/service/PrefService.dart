import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/info_model.dart';
import '../model/user_model.dart';

class PrefService{

  static storeName(String name) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", name);
  }

  static Future<String?> loadName()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("name");
  }

  static Future<bool> removeName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("name");
  }

  static storeInfo(Info info)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringInfo = jsonEncode(info);
    await prefs.setString('info', stringInfo);
  }

  static Future<Info?> loadInfo() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringInfo = prefs.getString("info");
    if(stringInfo == null || stringInfo.isEmpty) return null;

    Map<String, dynamic> map = jsonDecode(stringInfo);
    return Info.fromJson(map);
  }

  static Future<bool?> removeInfo() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("info");
  }

}