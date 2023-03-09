import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Your Details'),
          centerTitle: true,
        ),
        body: Container(
            width: 700.0,
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: controller.formKey,
              child: Column(children: [
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  child: TextFormField(
                    controller: controller.txt_nameController,
                    validator: (value) {
                      return controller.validateName(value!);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Name',
                        hintText: 'Enter Your Full Name'),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 700.0,
                  child: TextFormField(
                    controller: controller.txt_ageController,
                    validator: (value) {
                      return controller.validateAge(value!);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Age',
                        hintText: 'Enter your age'),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 700.0,
                  child: TextFormField(
                      controller: controller.txt_addressController,
                      validator: (value) {
                        return controller.validateAddress(value!);
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          labelText: 'Address',
                          hintText: 'Enter your address')),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: 100.0,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.checkSave();
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                )
              ]),
            )));
  }
}
