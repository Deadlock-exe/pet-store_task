import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_store/models/pet.dart';
import 'package:pet_store/pages/details_page.dart';

void main() {
  testWidgets('DetailsPage should render correctly',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: DetailsPage(
          pet: Pet(
            name: 'Test Pet',
            age: 2,
            price: 50,
            isAdopted: false,
            imageUrl: 'assets/images/pet1.png',
            inHistory: false,
          ),
          updateCallback: () {},
        ),
      ),
    );

    // Verify that the widget shows the correct details.
    expect(find.text('Name: Test Pet'), findsOneWidget);
    expect(find.text('Age: 2'), findsOneWidget);
    expect(find.text('Price: \$50'), findsOneWidget);
  });
}
