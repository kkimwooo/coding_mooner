import 'package:coding_mooner/pages/history_page_controller.dart';
import 'package:coding_mooner/pages/main_page.dart';
import 'package:coding_mooner/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryPageController());
    controller.getAllHistoryFromDB();
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
              child: const Text('홈으로')),
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
      body: Obx(() => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '질문 검색',
                  ),
                  onChanged: (value) {
                    controller.findHistoryFromList(value);
                  },
                ),
              ),
              Expanded(
                child: ListView(
                  children: controller.historyList
                      .map((e) => Card(
                            color: Colors.pink[50],
                            surfaceTintColor: Color(0xFFE0E0E0),
                            child: ListTile(
                              onTap: () {
                                Get.dialog(
                                  AlertDialog(
                                    title: Text(e.date),
                                    content: Container(
                                      width: MediaQuery.of(context).size.width * 0.5,
                                      height: MediaQuery.of(context).size.height * 0.8,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            MarkdownBody(
                                              data: "질문 ) ${e.question}",
                                              styleSheet: mdStyle,
                                              selectable: true,
                                            ),
                                            const Divider(
                                              color: Colors.black,
                                              thickness: 1,
                                            ),
                                            MarkdownBody(
                                              data: "답변 ) ${e.answer}",
                                              styleSheet: mdStyle,
                                              selectable: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text('닫기')),
                                    ],
                                  ),
                                );
                              },
                              title: Text(e.question.length >= 100
                                  ? "Q) ${e.question.substring(0, 100)}..."
                                  : "Q) ${e.question}"),
                              subtitle: Text(
                                  e.answer.length >= 100 ? "A) ${e.answer.substring(0, 100)}..." : "A) ${e.answer}"),
                              trailing: Text(DateFormat('y/M/d h:mm a').format(DateTime.parse(e.date))),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          )),
    );
  }
}
