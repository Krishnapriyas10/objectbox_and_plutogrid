import 'package:boxproject1/app/routes/app_pages.dart';
import 'package:boxproject1/database_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../entity_employee.dart';

class HomeController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController txt_nameController,
      txt_ageController,
      txt_addressController;

  @override
  void onInit() {
    super.onInit();
    txt_nameController = TextEditingController();
    txt_ageController = TextEditingController();
    txt_addressController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    txt_nameController.dispose();
    txt_ageController.dispose();
    txt_addressController.dispose();
  }

  String? validateName(String value) {
    if (value.isNum) {
      return 'name must be string';
    }
    return null;
  }

  String? validateAge(String value) {
    if (value.isNum) {
      return null;
    } else {
      return 'Age must be Number';
    }
  }

  String? validateAddress(String value) {
    if (value.length < 3) {
      return 'Address atleast 3 characters';
    }
    return null;
  }

  void checkSave() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      var data = entity_employee(
          name: txt_nameController.text,
          age: int.tryParse(txt_ageController.text) ?? 0,
          address: txt_addressController.text);
      databaseservice().insertupdateemployee(model: data);
      // return result;
      Get.toNamed(Routes.DATABASE);
    }
  }

  // void addnew() {}
}
