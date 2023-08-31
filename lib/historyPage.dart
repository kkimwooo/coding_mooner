import 'package:coding_mooner/historyPageController.dart';
import 'package:coding_mooner/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryPageController());
    controller.getHistoryFromDB();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('나의 작은 씨니어 개발자...코딩무너'),
        leading: const Image(
          image: AssetImage('images/128.png'),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.off(() => MainPage());
              },
              child: const Text('질문하기')),
          TextButton(
              onPressed: () {
                Get.dialog(
                  const AlertDialog(
                    title: Text("도움말"),
                    content: Text("Ollama 설치 가이드, 사용법 등에 대한 도움말이 들어갈 예정입니다."),
                  ),
                );
              },
              child: const Text('도움말')),
        ],
      ),
      body: Obx(() => ListView(
            children: controller.historyList
                .map((e) => Card(
                      child: ListTile(
                        title: Text(e.question.substring(0, 20)),
                        subtitle: Text(e.answer),
                        trailing: Text(e.date),
                      ),
                    ))
                .toList(),
          )),
    );
  }
}
