import 'package:coding_mooner/components/display_answer.dart';
import 'package:coding_mooner/components/input_question.dart';
import 'package:coding_mooner/pages/history_page.dart';
import 'package:coding_mooner/services/run_shell_script.dart';
import 'package:coding_mooner/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'main_page_controller.dart';

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
            onPressed: () async {
              await RunShellScript.runShellScript();
            },
            child: const Text('Ollama 실행'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Ollama 종료'),
          ),
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
                    title: const Text("도움말"),
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
          InputQuestion(controller: controller),
          displayAnswer(controller: controller),
        ],
      ),
    );
  }
}
