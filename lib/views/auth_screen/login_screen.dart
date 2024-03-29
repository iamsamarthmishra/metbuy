import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metbuy/controllers/auth_controller.dart';
import 'package:metbuy/views/home_screen/home.dart';
import 'package:metbuy/views/widgets/loading.dart';
import 'package:metbuy/views/widgets/our_button.dart';
import 'package:metbuy/views/widgets/text_style.dart';

import '../../const/const.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.heightBox,
              normalText(text: welcome, size: 25),
              20.heightBox,
              Row(
                children: [
                  Image.asset(
                    iclogo,
                    width: 70,
                    height: 70,
                  ).box.border(color: Colors.white).rounded.padding(const EdgeInsets.all(8)).make(),
                  const SizedBox(width: 10), // Add spacing between the image and the text
                  boldText(
                    text: appname,
                    size: 18,
                  ),
                ],
              ),
              20.heightBox,
              Obx(() => Column(
                children: [
                  TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: InputBorder.none,
                      hintText: emailHint,
                    ),
                  ),
                  20.heightBox,
                  TextFormField(
                    controller: controller.passwordController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: InputBorder.none,
                      hintText: passHint,
                    ),
                  ),
                  30.heightBox,
                  SizedBox(
                    width: context.screenWidth - 100,
                    child: controller.isloading.value
                        ? loadingIndicator()
                        : ourButton(
                      title: login,
                      onPress: () async {
                        controller.isloading(true);
                        await controller.loginMethod(context: context).then((value) {
                          if (value != null) {
                            VxToast.show(context, msg: loggedin);
                            controller.isloading(false);
                            Get.offAll(() => const Home());
                          } else {
                            controller.isloading(false);
                          }
                        });
                      },
                    ),
                  ),
                ],
              ).box.white.rounded.outerShadow.padding(const EdgeInsets.all(9)).make()),
              10.heightBox,
              Center(child: normalText(text: anyProblem)),
              5.heightBox,
              Center(child: boldText(text: contact)),
            ],
          ),
        ),
      ),
    );
  }
}
