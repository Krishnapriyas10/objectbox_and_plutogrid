import 'package:objectbox/objectbox.dart';

@Entity()
class entity_employee {
  @Id()
  int id = 0;
  String name;
  dynamic age;
  String address;
  entity_employee(
      {this.id = 0,
      required this.name,
      required this.age,
      required this.address});
}
