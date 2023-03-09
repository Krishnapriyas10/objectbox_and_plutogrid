import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/database_controller.dart';

class DatabaseView extends GetView<DatabaseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('DatabaseView'),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  // Get.bottomSheet(backgroundColor: Colors.blue,Container(height: 140.0,
                  //   child: Text('hii'),
                  // )
                  controller.addnew();
                },
                icon: Icon(Icons.add),
              ),
              IconButton(
                  onPressed: () {
                    Get.defaultDialog(
                        title: 'Search',
                        content: TextField(
                          controller: controller.txt_keyController,
                          decoration: InputDecoration(labelText: 'Search here'),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Get.bottomSheet(
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 254, 255),
                                  Container(
                                    child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(
                                              '${controller.search()[index].name}'),
                                          subtitle: Text(
                                              '${controller.search()[index].age}'),
                                        );
                                      },
                                      itemCount: controller.search().length,
                                    ),
                                  ));
                            },
                            child: Text('Search'),
                          )
                        ]);
                  },
                  icon: Icon(Icons.search))
            ]),
        body: Obx(
          () => ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: controller.modeldata.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.modeldata[index].name),
                subtitle: Text(
                    '${controller.modeldata()[index].age} => ${controller.modeldata[index].address}'),
                // leading: Icon(Icons.delete),
                trailing: FittedBox(
                    child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () {
                          controller
                              .deleteEmployee(controller.modeldata[index].id);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            controller
                                .editEmployee(controller.modeldata[index]);
                          },
                        ))
                  ],
                )),
              );
            },
          ),
        ));
  }

  Widget DesignWidget() {
    return Material(
      child: Container(
          height: 500.0,
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.txt_nameController,
                  validator: (value) {
                    return controller.validateName(value!);
                  },
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  controller: controller.txt_ageController,
                  validator: (value) {
                    return controller.validateAge(value!);
                  },
                  decoration: InputDecoration(labelText: 'Age'),
                ),
                TextFormField(
                  controller: controller.txt_addressController,
                  validator: (value) {
                    return controller.validateAddress(value!);
                  },
                  decoration: InputDecoration(labelText: 'Address'),
                ),
                Container(
                    child: Obx(
                  () => FloatingActionButton(
                    child: controller.updateflag.value != true
                        ? Text('Save')
                        : Text('Update'),
                    onPressed: () {
                      controller.checkLogin();
                    },
                  ),
                ))
              ],
            ),
          )),
    );
  }
}
