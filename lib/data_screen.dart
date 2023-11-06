import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_controller.dart';

class DataScreen extends GetView<UserController> {
  // final UserController controller = Get.find();

  const DataScreen({
    Key? key,
  }) : super(key: key);

  TextStyle commonStyle() => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );

  void teste() {
    print(controller.user.value.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dados'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Apresentação do nome
            GetX<UserController>(
              builder: (control) {
                return Text(
                  'Nome: ${control.user.value.name}',
                  style: commonStyle(),
                );
              },
            ),

            GetX<UserController>(
              builder: (control) {
                return Text(
                  'Idade: ${control.user.value.age}',
                  style: commonStyle(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
