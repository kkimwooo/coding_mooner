import 'package:coding_mooner/pages/historyPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'mainPageController.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(mainPageController());

    MarkdownStyleSheet mdStyle = MarkdownStyleSheet(
      h1: const TextStyle(
        fontFamily: 'Readex Pro',
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.normal,
      ),
      h2: const TextStyle(
        fontFamily: 'Readex Pro',
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.normal,
      ),
      h3: const TextStyle(
        fontFamily: 'Readex Pro',
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      h4: const TextStyle(
        fontFamily: 'Readex Pro',
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
      h5: const TextStyle(
        fontFamily: 'Readex Pro',
        color: Colors.black,
        fontSize: 10,
        fontWeight: FontWeight.normal,
      ),
      h6: const TextStyle(
        fontFamily: 'Readex Pro',
        color: Colors.black,
        fontSize: 5,
        fontWeight: FontWeight.normal,
      ),
      p: const TextStyle(
        fontFamily: 'Readex Pro',
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
      blockquote: const TextStyle(
        fontFamily: 'Readex Pro',
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
      strong: const TextStyle(
        fontFamily: 'Readex Pro',
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
      em: const TextStyle(
        fontFamily: 'Readex Pro',
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
      code: const TextStyle(
        fontFamily: 'Readex Pro',
        color: Colors.black,
        backgroundColor: Colors.transparent,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      codeblockPadding: const EdgeInsets.all(10),
      codeblockDecoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
    );

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
                Get.showSnackbar(const GetSnackBar(
                  title: "업데이트 완료",
                  message: "최신 프롬프트로 업데이트!!!",
                  duration: Duration(seconds: 3),
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.lightBlue,
                  margin: EdgeInsets.all(8),
                  borderRadius: 8,
                  isDismissible: true,
                  forwardAnimationCurve: Curves.easeOutBack,
                ));
              },
              child: const Text('업데이트')),
          TextButton(
              onPressed: () {
                Get.to(() => const HistoryPage());
              },
              child: const Text('기록보기')),
          TextButton(
              onPressed: () {
                Get.dialog(
                  AlertDialog(
                    title: Text("도움말"),
                    content: MarkdownBody(
                        data:
                            '반드시 먼저 Ollama를 로컬 서버에서 실행해야 합니다! \n\n### ollama 설치 및 실행 가이드 \n\n https://github.com/jmorganca/ollama 접속 \n\n1.1.Building(codellama:13b-instruct) \n\n1.2.Run a model(codellama:13b-instruct)',
                        selectable: true,
                        styleSheet: mdStyle),
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
                            items: const [
                              DropdownMenuItem(
                                value: "codeReview",
                                child: Text("코드 리뷰 해줘"),
                              ),
                              DropdownMenuItem(
                                value: "explain",
                                child: Text("코드 설명 해줘"),
                              ),
                              DropdownMenuItem(
                                value: "tc",
                                child: Text("Test Code 좀..."),
                              ),
                              DropdownMenuItem(
                                value: "TDD",
                                child: Text(
                                  "TDD방식으로 구현코드 생성",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "sql",
                                child: Text("SQL 만들어줘"),
                              ),
                              DropdownMenuItem(
                                value: "etc",
                                child: Text("아무거나"),
                              ),
                            ],
                            value: controller.mainType.value,
                            onChanged: (value) {
                              //print(value);
                              if (value == "sql") {
                                controller.subType.value = "mysql";
                              } else if (value == "TDD") {
                                controller.subType.value = "";
                              } else {
                                controller.subType.value = "Spring";
                              }
                              controller.mainType.value = value!;
                            }),
                        controller.mainType.value == "codeReview" ||
                                controller.mainType.value == "tc" ||
                                controller.mainType.value == "explain"
                            ? DropdownButton(
                                items: const [
                                    DropdownMenuItem(
                                      value: "Spring",
                                      child: Text("Spring"),
                                    ),
                                    DropdownMenuItem(
                                      value: "JAVA",
                                      child: Text("JAVA"),
                                    ),
                                    DropdownMenuItem(
                                      value: "PYTHON",
                                      child: Text("PYTHON"),
                                    ),
                                    DropdownMenuItem(
                                      value: "JavaScript",
                                      child: Text("Java Script"),
                                    ),
                                  ],
                                value: controller.subType.value,
                                onChanged: (value) {
                                  //print(value);
                                  controller.subType.value = value!;
                                })
                            : controller.mainType.value == "sql"
                                ? DropdownButton(
                                    items: const [
                                        DropdownMenuItem(
                                          value: "mysql",
                                          child: Text("MY SQL"),
                                        ),
                                        DropdownMenuItem(
                                          value: "Oracle",
                                          child: Text("Oracle"),
                                        ),
                                        DropdownMenuItem(
                                          value: "auroraDB",
                                          child: Text("Aurora DB"),
                                        ),
                                      ],
                                    value: controller.subType.value,
                                    onChanged: (value) {
                                      controller.subType.value = value!;
                                    })
                                : const SizedBox.shrink(),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                          ),
                          onPressed: () async {
                            controller.getAnswer();
                          },
                          child: const Text(
                            '도와줘(클릭)',
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
                          controller: controller.questionTextController,
                          autofocus: true,
                          obscureText: false,
                          decoration: const InputDecoration(
                            alignLabelWithHint: true,
                            labelText: '코드/요구사항을 입력해주세요',
                          ),
                          style: const TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                          maxLines: 100,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => Container(
              width: MediaQuery.sizeOf(context).width * 0.5,
              height: MediaQuery.sizeOf(context).height * 1,
              decoration: const BoxDecoration(
                color: Color.fromARGB(0, 82, 131, 0),
              ),
              child: controller.loading.value
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/loading.gif", width: 500, height: 500, fit: BoxFit.contain),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            width: 250.0,
                            child: DefaultTextStyle(
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                              ),
                              child: AnimatedTextKit(
                                repeatForever: true,
                                pause: const Duration(milliseconds: 2000),
                                animatedTexts: [
                                  FadeAnimatedText('아 이거~'),
                                  FadeAnimatedText('문어는 고민 중'),
                                  FadeAnimatedText('이 정도쯤이야!'),
                                  FadeAnimatedText('음....'),
                                  FadeAnimatedText('잠깐만...아는거야'),
                                  FadeAnimatedText('거의 다 풀었어'),
                                  FadeAnimatedText('1초만 더 기다려줘'),
                                  FadeAnimatedText('5초만 더 기다려줘'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: controller.answer.value == ''
                          ? Image.asset("images/coding_mooner_black.jpg", width: 500, height: 500, fit: BoxFit.contain)
                          : ListView(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Clipboard.setData(ClipboardData(text: controller.answer.value));
                                          Get.showSnackbar(const GetSnackBar(
                                            title: "복사 완료",
                                            message: "클립보드에 복사되었습니다.",
                                            duration: Duration(seconds: 3),
                                            snackPosition: SnackPosition.TOP,
                                            backgroundColor: Colors.lightBlue,
                                            margin: EdgeInsets.all(8),
                                            borderRadius: 8,
                                            isDismissible: true,
                                            forwardAnimationCurve: Curves.easeOutBack,
                                          ));
                                        },
                                        icon: const Icon(Icons.copy)),
                                  ],
                                ),
                                MarkdownBody(
                                  data: controller.answer.value,
                                  selectable: true,
                                  styleSheet: mdStyle,
                                ),
                              ],
                            ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
