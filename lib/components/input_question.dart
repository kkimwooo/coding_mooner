import 'package:coding_mooner/pages/main_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class InputQuestion extends StatelessWidget {
  const InputQuestion({
    super.key,
    required this.controller,
  });

  final mainPageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
