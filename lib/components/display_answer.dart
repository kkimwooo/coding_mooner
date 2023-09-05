import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:coding_mooner/pages/main_page_controller.dart';
import 'package:coding_mooner/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

class displayAnswer extends StatelessWidget {
  const displayAnswer({
    super.key,
    required this.controller,
  });

  final mainPageController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
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
    );
  }
}
