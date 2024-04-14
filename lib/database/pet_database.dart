import 'package:hive_flutter/hive_flutter.dart';

class PetDatabase {
  late List<bool> adoptedStatus = [];
  final _petBox = Hive.box('petbox');

  void createInitialData() {
    adoptedStatus = [];
  }

  void readData() {
    adoptedStatus = _petBox.get(
      "ADOPTEDPETS",
      defaultValue: [],
    );
  }

  void updateData() {
    _petBox.put("ADOPTEDPETS", adoptedStatus);
  }
}
