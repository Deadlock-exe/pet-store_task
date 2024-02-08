import 'package:flutter/material.dart';
import 'package:pet_store/models/pet.dart';

class DetailsPage extends StatelessWidget {
  final Pet pet;

  const DetailsPage({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[200],
        title: const Text('Pet Details'),
      ),
      body: Center(
        child: Hero(
          tag: 'pet-${pet.name}',
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(pet.imageUrl),
                const SizedBox(height: 35),
                Text(
                  'Name: ${pet.name}',
                  style: const TextStyle(
                    fontSize: 22,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  'Age: ${pet.age}',
                  style: const TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  'Price: \$${pet.price}',
                  style: const TextStyle(
                    fontSize: 18,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(16.0),
                  ),
                  child: const Text(
                    'Adopt Me',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
