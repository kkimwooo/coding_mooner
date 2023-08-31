import 'package:coding_mooner/services/db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class mainPageController extends GetxController {
  TextEditingController textController = TextEditingController();

  RxString type = '코드리뷰'.obs;
  RxString answer = ''.obs;

  RxBool loading = false.obs;

  getAnswer() async {
    print("getAnswer start");
    if (textController.value.text == "") {
      Get.dialog(
        AlertDialog(
          title: const Text("에러"),
          content: Text("질문을 해야 답을 주지."),
        ),
      );
      return;
    }

    loading.value = true;

    var question = textController.value.text;
    var url = Uri.parse('http://localhost:11434/api/generate');
    var data = {
      "model": "codellama",
      "prompt": question,
    };
    var body = json.encode(data);
    print("My body : " + body);

    try {
      var response = await http.post(url, headers: {"Content-Type": "application/json"}, body: body);
      String result = response.body;

      print("1 : " + result);
      List resultList = result.split(',"done":false}');
      List preJsonList = resultList.map((e) => e + "}").toList();
      preJsonList.removeLast();
      preJsonList.removeLast();
      print("2 : " + preJsonList.toString());

      var finalResult = "";
      preJsonList.forEach((element) {
        finalResult += json.decode(element)["response"];
      });

      print("3 : " + finalResult);
      answer.value = finalResult;

      DB.insert(question, finalResult);
    } catch (e) {
      print("error : " + e.toString());

      Get.dialog(
        AlertDialog(
          title: const Text("에러"),
          content: Text("미안하다...에러 났다..."),
        ),
      );
    } finally {
      loading.value = false;
      //textController.clear();
    }
  }
}
