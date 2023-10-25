import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dailoghelper {
  //show error dailog
  static showErrorDailog(
      {String title = 'Error', String description = 'Something went wrong.'}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title),
              Text(description),
              ElevatedButton(
                  onPressed: () {
                    if (Get.isDialogOpen ?? false) {
                      Get.back();
                    }
                  },
                  child: const Text('okay'))
            ],
          ),
        ),
      ),
    );
  }

  static showLoading({String message = ''}) {
    return Get.dialog(Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(
              height: 8,
            ),
            Text(message),
          ],
        ),
      ),
    ));
  }

  static hideLoading() {
    if (Get.isDialogOpen ?? false) Get.back();
  }
}
