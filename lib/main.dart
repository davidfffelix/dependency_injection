// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_intro/user_controller.dart';

void main() {
  runApp(const MyApp());
  Get.lazyPut<UserController>(() {
    return UserController();
  });
// Get.put<UserController>(UserController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final ageController = TextEditingController();

  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Campo de nome
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                    ),
                  ),
                ),

                // Botão para salvar o nome
                ElevatedButton(
                  onPressed: () {
                    userController.setUserName(nameController.text);
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),

            // Espaçamento
            const SizedBox(height: 10),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Campo de idade
                Expanded(
                  child: TextField(
                    controller: ageController,
                    decoration: const InputDecoration(
                      labelText: 'Idade',
                    ),
                  ),
                ),

                // Botão para salvar a idade
                ElevatedButton(
                  onPressed: () {
                    userController.setUserAge(int.parse(ageController.text));
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),

            // Espaçamento
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const DataScreen();
                    },
                  ),
                );
              },
              child: const Text('Tela de dados'),
            ),
          ],
        ),
      ),
    );
  }
}

class DataScreen extends GetView<UserController> {
  // final UserController controller = Get.find();

  const DataScreen({
    Key? key,
  }) : super(key: key);

  TextStyle commonStyle() => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );

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

            // Apresentação da idade
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