import 'package:boxproject1/app/modules/database/views/database_view.dart';
import 'package:boxproject1/database_service.dart';
import 'package:boxproject1/entity_employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController txt_nameController,
      txt_ageController,
      txt_addressController,
      txt_keyController;
  var updateflag = false.obs;
  var update_entityid = 0;
  var modeldata = <entity_employee>[].obs;

  @override
  void onInit() {
    super.onInit();
    txt_nameController = TextEditingController();
    txt_ageController = TextEditingController();
    txt_addressController = TextEditingController();
    txt_keyController = TextEditingController();
    allEmployee();
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
    // txt_keyController.dispose();
  }

  List allEmployee() {
    modeldata.value = databaseservice().getAllEmployee();
    return modeldata;
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
      return 'Address atleast 15 characters';
    }
    return null;
  }

  void addnew() {
    Get.bottomSheet(DatabaseView().DesignWidget());
    updateflag.value = false;
    update_entityid = 0;
  }

  void checkLogin() {
    final isvalid = formKey.currentState!.validate();
    if (!isvalid) {
      return;
    } else {
      press();
    }
  }

  void press() {
    var data = entity_employee(
        id: update_entityid,
        name: txt_nameController.text,
        age: int.tryParse(txt_ageController.text) ?? 0,
        address: txt_addressController.text);
    databaseservice().insertupdateemployee(model: data);
    clearData();
    Get.back();
    getAllEmployeedata();
  }

  void clearData() {
    txt_nameController.clear();
    txt_ageController.clear();
    txt_addressController.clear();
  }

  List getAllEmployeedata() {
    modeldata.clear();
    modeldata.value = databaseservice().getAllEmployee();
    return modeldata;
  }

  List search() {
    var key = txt_keyController.text;
    List model = databaseservice().searchEmployee(searchKey: key);
    return model;
  }

  void deleteEmployee(int id) {
    databaseservice().deleteEmployee(rowid: id);
    getAllEmployeedata();
  }

  void editEmployee(entity_employee modeldata) {
    updateflag.value = true;
    update_entityid = modeldata.id;
    txt_nameController.text = modeldata.name;
    txt_addressController.text = modeldata.address;
    txt_ageController.text = modeldata.age.toString();

    Get.bottomSheet(
      DatabaseView().DesignWidget(),
    );
  }
}
