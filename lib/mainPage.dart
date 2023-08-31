import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'mainPageController.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(mainPageController());
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 0.5,
                height: MediaQuery.sizeOf(context).height * 1,
                decoration: const BoxDecoration(
                  color: Color(0xFFCC3E3E),
                ),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: TextFormField(
                        controller: controller.textController,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: '코드를 입력하세요',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.redAccent,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        maxLines: 35,
                        //validator: _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                    Obx(() => Row(
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
                        )),
                  ],
                ),
              ),
              Obx(() => Container(
                    child: controller.loading.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView(
                            children: [
                              Text(controller.answer.value),
                            ],
                          ),
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    height: MediaQuery.sizeOf(context).height * 1,
                    decoration: const BoxDecoration(
                      color: Colors.yellow,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
