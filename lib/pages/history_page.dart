import 'package:flutter/material.dart';
import 'package:pet_store/models/pet.dart';

class HistoryPage extends StatelessWidget {
  final List<Pet> adoptedPets;
  const HistoryPage({
    super.key,
    required this.adoptedPets,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Adoption History'),
      ),
      body: ListView.builder(
        itemCount: adoptedPets.length,
        itemBuilder: (context, index) {
          final pet = adoptedPets[index];
          return ListTile(
            title: Text(pet.name),
            subtitle: Text('Age: ${pet.age} | Price: \$${pet.price}'),
            leading: CircleAvatar(
              backgroundImage: AssetImage(pet.imageUrl),
            ),
          );
        },
      ),
    );
  }
}
