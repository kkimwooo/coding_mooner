import 'package:coding_mooner/model/prompts.dart';
import 'package:coding_mooner/services/db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class mainPageController extends GetxController {
  TextEditingController questionTextController = TextEditingController();

  RxString mainType = 'codeReview'.obs;
  RxString subType = 'JAVA'.obs;
  RxString answer = ''.obs;
  RxBool loading = false.obs;

  TextEditingController modelTextController = TextEditingController();

  //Download txt file from aws s3
  void downloadFile() async {
    //s3://coding.mooner.prompt/coding_mooner_prompt.rtf
    var url = Uri.parse('https://s3.ap-northeast-2.amazonaws.com/coding.mooner.prompt/coding_mooner_prompt.rtf');
    var response = await http.get(url);
    var body = response.body;
    print(body);
  }

  getAnswer() async {
    if (questionTextController.value.text == "") {
      Get.dialog(
        const AlertDialog(
          title: Text("에러"),
          content: Text("질문을 해야 답을 주지."),
        ),
      );
      return;
    }

    loading.value = true;
    var question = selectPrompt(mainType.value, subType.value, questionTextController.value.text);

    var url = Uri.parse('http://localhost:11434/api/generate');
    var data = {
      "model": modelTextController.value.text == "" ? "codellama:13b-instruct" : modelTextController.value.text,
      "prompt": question,
    };
    var body = json.encode(data);
    print("My body : $body");

    try {
      var response = await http.post(url, headers: {"Content-Type": "application/json"}, body: body);
      String result = response.body;

      //print("1 : $result");
      List resultList = result.split(',"done":false}');
      List preJsonList = resultList.map((e) => e + "}").toList();
      preJsonList.removeLast();
      preJsonList.removeLast();
      //print("2 : $preJsonList");

      var finalResult = "";
      preJsonList.forEach((element) {
        finalResult += json.decode(element)["response"];
      });

      //print("3 : $finalResult");
      answer.value = finalResult;

      DB.insert(question, finalResult);
    } catch (e) {
      print("error : $e");

      Get.dialog(
        const AlertDialog(
          title: Text("에러"),
          content: Text("미안하다...에러 났다..."),
        ),
      );
    } finally {
      loading.value = false;
      //textController.clear();
    }
  }
}
