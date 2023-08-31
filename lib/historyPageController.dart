import 'dart:convert';

import 'package:coding_mooner/model/history.dart';
import 'package:coding_mooner/services/db.dart';
import 'package:get/get.dart';

class HistoryPageController extends GetxController {
  RxList<History> historyList = <History>[].obs;

  getHistoryFromDB() async {
    print('getHistoryFromDB');
    var result = await DB.queryAll();
    // historyList.value = (await DB.queryAll()).cast<History>();
    var result2 = result.map((e) => History.fromJon(e)).toList();
    print(result2);
    historyList.value = result2;
  }
}
