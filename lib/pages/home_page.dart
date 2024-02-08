import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:pet_store/models/list_pets.dart' as petData;
import 'package:pet_store/models/list_pets.dart';
import 'package:pet_store/models/pet.dart';
import 'package:pet_store/pages/details_page.dart';
import 'package:pet_store/pages/history_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<Pet> displayedPets = petData.pets; // Use the correct name
  bool isSearchBarVisible = false;
  List<Pet> adoptedPets = [];

  @override
  void initState() {
    _searchController.addListener(() {
      _searchPets(_searchController.text);
    });
    super.initState();
  }

  void _searchPets(String query) {
    setState(() {
      displayedPets = petData.pets
          .where((pet) => pet.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _updatePetList() {
    setState(() {
      adoptedPets.clear();
      adoptedPets.addAll(displayedPets.where((pet) => pet.inHistory));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Pet Adoption Home'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HistoryPage(adoptedPets: adoptedPets),
                ),
              );
            },
            icon: const Icon(Icons.history),
          ),
          IconButton(
            icon: Icon(
              isSearchBarVisible ? Icons.close : Icons.search,
            ),
            onPressed: () {
              setState(() {
                isSearchBarVisible = !isSearchBarVisible;
                if (!isSearchBarVisible) {
                  displayedPets = petData.pets;
                  _searchController.clear();
                }
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          children: [
            if (isSearchBarVisible)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                    ),
                    hintText: 'Search by name',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 0,
                ),
                itemCount: displayedPets.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Hero(
                      transitionOnUserGestures: true,
                      tag: 'pet-${displayedPets[index].name}',
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            colorFilter: displayedPets[index].isAdopted
                                ? const ColorFilter.mode(
                                    Colors.grey,
                                    BlendMode.saturation,
                                  ) // Make the image black and white for adopted pets
                                : null,
                            fit: BoxFit.cover,
                            image: AssetImage(displayedPets[index].imageUrl),
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
                      final updatedPet = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            pet: pets[index],
                            updateCallback: _updatePetList,
                          ),
                        ),
                      );

                      if (updatedPet != null) {
                        setState(() {
                          final int petIndex = pets
                              .indexWhere((pet) => pet.name == updatedPet.name);
                          if (petIndex != -1) {
                            pets[petIndex] = updatedPet;
                          }
                        });
                        _updatePetList();
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
