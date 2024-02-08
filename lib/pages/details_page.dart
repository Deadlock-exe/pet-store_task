import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:pet_store/models/pet.dart';

class DetailsPage extends StatefulWidget {
  final Pet pet;
  final VoidCallback updateCallback;

  const DetailsPage({
    super.key,
    required this.pet,
    required this.updateCallback,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    _confettiController = ConfettiController();
    super.initState();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void showAdoptedDialog(Pet pet) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Yayy!'),
            content: Text('You have now adopted ${pet.name}.'),
            actions: [
              TextButton(
                onPressed: () {
                  _confettiController.play();
                  widget
                      .updateCallback(); // Create a new controller for future use
                  Navigator.pop(context, pet);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

    void showAlreadyAdoptedDialog(Pet pet) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Already Adopted'),
            content: Text('${pet.name} has already been adopted.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

    void adoptPet(Pet pet) {
      if (widget.pet.isAdopted) {
        showAlreadyAdoptedDialog(pet);
      } else {
        showAdoptedDialog(pet);
        setState(() {
          pet.isAdopted = !pet.isAdopted;
          pet.inHistory = true;
        });
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Pet Details'),
      ),
      body: Center(
        child: Hero(
          tag: 'pet-${widget.pet.name}',
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColorFiltered(
                  colorFilter: widget.pet.isAdopted == true
                      ? const ColorFilter.mode(
                          Colors.grey,
                          BlendMode.saturation,
                        )
                      : const ColorFilter.mode(
                          Colors
                              .transparent, // You can use Colors.transparent for no filter
                          BlendMode.darken,
                        ),
                  child: Image.asset(
                    widget.pet.imageUrl,
                  ),
                ),
                const SizedBox(height: 35),
                Text(
                  'Name: ${widget.pet.name}',
                  style: const TextStyle(
                    fontSize: 22,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  'Age: ${widget.pet.age}',
                  style: const TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  'Price: \$${widget.pet.price}',
                  style: const TextStyle(
                    fontSize: 18,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    adoptPet(widget.pet);
                  },
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
                ConfettiWidget(
                  confettiController: _confettiController,
                  blastDirection: 3.14,
                  emissionFrequency: 0.05,
                  numberOfParticles: 20,
                  maxBlastForce: 100,
                  minBlastForce: 80,
                  blastDirectionality: BlastDirectionality.explosive,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
