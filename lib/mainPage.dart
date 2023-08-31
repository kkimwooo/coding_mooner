import 'package:coding_mooner/historyPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'mainPageController.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(mainPageController());
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
                Get.to(() => HistoryPage());
              },
              child: const Text('기록보기')),
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
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.5,
            height: MediaQuery.sizeOf(context).height * 1,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 184, 216, 180),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              child: Column(
                children: [
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        DropdownButton(
                            items: ["코드리뷰", "TC 생성", "??"].map((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: controller.type.value,
                            onChanged: (value) {
                              print(value);
                              controller.type.value = value!;
                            }),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                          ),
                          onPressed: () async {
                            controller.getAnswer();
                          },
                          child: const Text(
                            '도와줘',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        TextFormField(
                          controller: controller.textController,
                          autofocus: true,
                          obscureText: false,
                          decoration: const InputDecoration(
                            alignLabelWithHint: true,
                            labelText: '코드를 입력하세요',
                          ),
                          style: const TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                          maxLines: 100,
                          //validator: _model.textControllerValidator.asValidator(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(() => Container(
                child: controller.loading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView(
                          children: [
                            Text(controller.answer.value),
                          ],
                        ),
                      ),
                width: MediaQuery.sizeOf(context).width * 0.5,
                height: MediaQuery.sizeOf(context).height * 1,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(0, 82, 131, 0),
                ),
              )),
        ],
      ),
    );
  }
}
