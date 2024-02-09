import 'package:hive_flutter/hive_flutter.dart';
import 'package:pet_store/models/pet.dart';

class PetDatabase {
  List pets = [];
  late Box _petBox;

  void createInitialData() {
    pets = [
      Pet(
        name: 'Dog',
        age: 3,
        price: 100,
        isAdopted: false,
        imageUrl: 'assets/images/pet1.png',
        inHistory: false,
      ),
      Pet(
        name: 'Cat',
        age: 2,
        price: 120,
        isAdopted: false,
        imageUrl: 'assets/images/pet2.png',
        inHistory: false,
      ),
      Pet(
        name: 'Bird',
        age: 1,
        price: 40,
        isAdopted: false,
        imageUrl: 'assets/images/pet3.png',
        inHistory: false,
      ),
      Pet(
        name: 'Hamster',
        age: 2,
        price: 80,
        isAdopted: false,
        imageUrl: 'assets/images/pet4.png',
        inHistory: false,
      ),
      Pet(
        name: 'Horse',
        age: 4,
        price: 200,
        isAdopted: false,
        imageUrl: 'assets/images/pet5.png',
        inHistory: false,
      ),
      Pet(
        name: 'Tiger',
        age: 3,
        price: 500,
        isAdopted: false,
        imageUrl: 'assets/images/pet6.png',
        inHistory: false,
      ),
      Pet(
        name: 'Bear',
        age: 3,
        price: 500,
        isAdopted: false,
        imageUrl: 'assets/images/pet7.png',
        inHistory: false,
      ),
      Pet(
        name: 'Snake',
        age: 2,
        price: 400,
        isAdopted: false,
        imageUrl: 'assets/images/pet8.png',
        inHistory: false,
      ),
      Pet(
        name: 'Otter',
        age: 2,
        price: 100,
        isAdopted: false,
        imageUrl: 'assets/images/pet9.png',
        inHistory: false,
      ),
      Pet(
        name: 'Wolf',
        age: 3,
        price: 300,
        isAdopted: false,
        imageUrl: 'assets/images/pet10.png',
        inHistory: false,
      ),
      Pet(
        name: 'Frog',
        age: 1,
        price: 100,
        isAdopted: false,
        imageUrl: 'assets/images/pet11.png',
        inHistory: false,
      ),
      Pet(
        name: 'Elephant',
        age: 5,
        price: 600,
        isAdopted: false,
        imageUrl: 'assets/images/pet12.png',
        inHistory: false,
      ),
      Pet(
        name: 'Sloth',
        age: 3,
        price: 300,
        isAdopted: false,
        imageUrl: 'assets/images/pet13.png',
        inHistory: false,
      ),
      Pet(
        name: 'Panda',
        age: 3,
        price: 400,
        isAdopted: false,
        imageUrl: 'assets/images/pet14.png',
        inHistory: false,
      ),
    ];

    _updateBox();
  }

  void _updateBox() {
    if (_petBox.isOpen) {
      _petBox.clear();
      _petBox.addAll(pets);
    }
  }

  void readData() {
    pets = List<Pet>.from(_petBox.get('pets', defaultValue: []));
  }

  void updateData() {
    _updateBox();
  }

  void saveStatus() {
    _updateBox();
  }
}