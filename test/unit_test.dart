import 'package:flutter_test/flutter_test.dart';
import 'package:pet_store/models/pet.dart';

void main() {
  group('Pet Tests', () {
    test('Pet should be adopted correctly', () {
      Pet pet = Pet(
        name: 'Test Pet',
        age: 2,
        price: 50,
        isAdopted: false,
        imageUrl: 'assets/images/test_pet.png',
        inHistory: false,
      );

      expect(pet.isAdopted, false);

      pet.setAdopted(true);

      expect(pet.isAdopted, true);
    });
  });
}
