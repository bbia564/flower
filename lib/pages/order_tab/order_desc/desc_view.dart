import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'desc_logic.dart';

class DescView extends GetView<PageLogic> {
  const DescView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.nikolaus.value
              ? const CircularProgressIndicator(color: Colors.greenAccent)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.rnjf();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
