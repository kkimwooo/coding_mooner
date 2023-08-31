import 'package:coding_mooner/model/history.dart';
import 'package:coding_mooner/services/db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryPageController extends GetxController {
  List<History> firstHistoryList = [];

  RxList<History> historyList = <History>[].obs;

  getAllHistoryFromDB() async {
    var result = await DB.queryAll();
    var result2 = result.map((e) => History.fromJon(e)).toList();
    firstHistoryList = result2;
    historyList.value = firstHistoryList;
  }

  findHistoryFromList(String question) {
    historyList.value = firstHistoryList.where((element) => element.question.contains(question)).toList();
  }
}
