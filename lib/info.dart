import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  final String prediction;

  InfoPage({required this.prediction});

  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/'; // Set the image path based on the prediction
    String title = ''; // Set the title based on the prediction
    String description = ''; // Set the description based on the prediction

    // Customize image, title, and description based on the prediction
    switch (prediction) {
      case 'koththu':
        imagePath = 'assets/koththu.jpeg';
        title = 'Koththu';
        description =
            'Koththu is a popular Sri Lankan dish made with chopped roti, vegetables, and spices. It is known for its savory and flavorful taste, often enjoyed as a street food.';
        break;
      case 'roti':
        imagePath = 'assets/roti.jpg';
        title = 'Roti';
        description =
            'Roti is a type of unleavened flatbread commonly enjoyed in Sri Lanka. It is a versatile dish that can be served with various curries and accompaniments.';
        break;
      case 'hoppers':
        imagePath = 'assets/hoppers.jpg';
        title = 'Hoppers';
        description =
            'Hoppers are a traditional Sri Lankan pancake-like dish made from rice flour and coconut milk. They come in different varieties, including egg hoppers and plain hoppers.';
        break;
      case 'wade':
        imagePath = 'assets/wade.jpg';
        title = 'Wade (Vadai)';
        description =
            'Wade, or vadai, are deep-fried lentil fritters often served as snacks in Sri Lanka. They are crispy on the outside and soft on the inside, making them a popular street food.';
        break;
      case 'string hoppers':
        imagePath = 'assets/string hoppers.png';
        title = 'String Hoppers';
        description =
            'String hoppers are thin rice noodles often served with curries in Sri Lanka. They are steamed to perfection and are a common part of Sri Lankan cuisine.';
        break;
      case 'milk rice':
        imagePath = 'assets/milk rice.png';
        title = 'Milk Rice';
        description =
            'Milk rice is a traditional Sri Lankan dish made from rice and coconut milk, often served during festivals and special occasions. It has a creamy and rich texture.';
        break;
      default:
        imagePath = 'assets/default_image.jpg'; // Default image if no match
        title = 'Unknown Food';
        description = 'No information available for this prediction.';
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Prediction Details'),
        backgroundColor: Colors.amber, // Customize the app bar color
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Food : $title',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.asset(
              imagePath,
              width: 300, // Adjust the width as needed
              height: 300, // Adjust the height as needed
              fit: BoxFit.cover, // Ensure the image covers the available space
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the InfoPage
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber, // Customize the button color
                foregroundColor: Colors.white, // Customize the text color
              ),
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
