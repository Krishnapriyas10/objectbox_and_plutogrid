import 'package:path_provider/path_provider.dart'
    show getApplicationSupportDirectory;

import 'entity_employee.dart' show entity_employee;
import 'objectbox.g.dart' show Query, entity_employee_, openStore;

class databaseservice {
  static late var store;
  static Future<void> intilizedb() async {
    final docsdir = await getApplicationSupportDirectory();

    store = await openStore(Directory: '${docsdir.path}/sampledatabase');
  }

  void insertupdateemployee({required entity_employee model}) {
    store.box<entity_employee>().put(model);
  }

  deleteEmployee({required int rowid}) {
    store.box<entity_employee>().remove(rowid);
  }

  List<entity_employee> getAllEmployee() {
    return store.box<entity_employee>().getAll();
  }

  List<entity_employee> searchEmployee({required String searchKey}) {
    Query<entity_employee> query = store
        .box<entity_employee>()
        .query(entity_employee_.name.contains(searchKey))
        .build();
    return query.find();
  }
}
