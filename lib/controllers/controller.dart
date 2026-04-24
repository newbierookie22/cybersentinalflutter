import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/service.dart';
import '../screens/scanning_screen.dart';
import '../screens/result_screen.dart';

class LinkCheckerController extends GetxController {
  final TextEditingController linkController = TextEditingController();

  void checkLink() async {
    String url = linkController.text.trim();

    if (url.isEmpty) {
      Get.snackbar("Error", "Please enter a URL");
      return;
    }

    // 👉 Go to scanning screen
    Get.to(() => const ScanningScreen());

    try {
      final data = await LinkCheckerService.scanUrl(url);

      // 👉 Replace scanning screen with result screen
      Get.off(() => ResultScreen(data: data));

      // 👉 Clear input (optional)
      linkController.clear();

    } catch (e) {
      // 👉 Go back if error
      Get.back();

      Get.snackbar("Error", "Failed to connect to server");
    }
  }

  @override
  void onClose() {
    linkController.dispose();
    super.onClose();
  }
}