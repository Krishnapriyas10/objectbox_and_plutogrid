import 'package:boxproject1/database_service.dart';
import 'package:boxproject1/entity_employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';

class PlutogridController extends GetxController {
  //TODO: Implement PlutogridController
  final List<PlutoColumn> columns = [];
  final List<PlutoRow> rows = [];
  late final PlutoGridStateManager stateManager;
  var obj_data = <entity_employee>[].obs;
  late TextEditingController txt_namecontroller,
      txt_agecontroller,
      txt_addresscontroller;
  int i = 0;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    txt_namecontroller = TextEditingController();
    txt_agecontroller = TextEditingController();
    txt_addresscontroller = TextEditingController();

    columns.addAll([
      PlutoColumn(title: 'ID', field: 'Id', type: PlutoColumnType.text()),
      PlutoColumn(title: 'NAME', field: 'Name', type: PlutoColumnType.text()),
      PlutoColumn(title: 'AGE', field: 'Age', type: PlutoColumnType.text()),
      PlutoColumn(
          title: 'ADDRESS', field: 'Address', type: PlutoColumnType.text())
    ]);
    allemployee();
    // entity_employee getEvent(Index) {
    //   return obj_data[Index];
    // }
    for (var i = 0; i < obj_data.length; i++) {
      rows.addAll([
        PlutoRow(cells: {
          'Id': PlutoCell(value: '${obj_data()[i].id}'),
          'Name': PlutoCell(value: '${obj_data()[i].name}'),
          'Age': PlutoCell(value: '${obj_data()[i].age}'),
          'Address': PlutoCell(value: '${obj_data()[i].address}')
        }),
        // PlutoRow(cells: {
        //   'Id': PlutoCell(value: '${obj_data()[i].id}'),
        //   'Name': PlutoCell(value: '${obj_data()[i].name}'),
        //   'Age': PlutoCell(value: '${obj_data()[i].age}'),
        //   'Address': PlutoCell(value: '${obj_data()[i].address}')
        // })
        // PlutoRow(cells: cells)
      ]);
    }
    
  }

  // PlutoGridStateManager.initializeRowsAsync(
  //   columns,
  //   rows,
  // ).then((value) =>
  //     stateManager.refRows.addAll(FilteredList(initialList: value)));
  // stateManager.notifyListeners();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  List allemployee() {
    print('jjjj');
    obj_data.value = databaseservice().getAllEmployee();
    return obj_data;
  }
}
