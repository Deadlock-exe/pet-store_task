class Pet {
  final String name;
  final int age;
  final int price;
  bool isAdopted;
  final String imageUrl;
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
