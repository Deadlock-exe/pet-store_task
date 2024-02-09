import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Pet extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int age;

  @HiveField(2)
  final int price;

  @HiveField(3)
  bool isAdopted;

  @HiveField(4)
  final String imageUrl;

  @HiveField(5)
  bool inHistory;

  Pet({
    required this.name,
    required this.age,
    required this.price,
    required this.isAdopted,
    required this.imageUrl,
    required this.inHistory,
  });
  setAdopted(bool value) {
    isAdopted = value;
  }
}
