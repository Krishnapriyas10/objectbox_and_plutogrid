import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../controllers/plutogrid_controller.dart';

class PlutogridView extends GetView<PlutogridController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PlutogridView'),
          centerTitle: true,
        ),
        body:Obx(() =>  PlutoGrid(
            columns: controller.columns,
            rows: controller.rows,
            onChanged: (PlutoGridOnChangedEvent event) {
              print(event);
              
            },
            onLoaded: (PlutoGridOnLoadedEvent event) {
              event.stateManager.setSelectingMode(PlutoGridSelectingMode.cell);
            })));
  }
}
