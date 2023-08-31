import 'package:coding_mooner/model/history.dart';
import 'package:coding_mooner/services/db.dart';
import 'package:get/get.dart';

class HistoryPageController extends GetxController {
  RxList<History> historyList = <History>[].obs;

  getAllHistoryFromDB() async {
    var result = await DB.queryAll();
    var result2 = result.map((e) => History.fromJon(e)).toList();
    historyList.value = result2;
  }
}
