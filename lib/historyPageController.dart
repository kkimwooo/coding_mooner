import 'package:coding_mooner/services/db.dart';
import 'package:get/get.dart';

class HistoryPageController extends GetxController {
  RxList<History> historyList = <History>[].obs;

  getHistoryFromDB() async {
    historyList.value = (await DB.queryAll()).cast<History>();
    print(historyList.value);
  }
}

class History {
  String question;
  String answer;
  String date;

  History(this.date, this.question, this.answer);
}
