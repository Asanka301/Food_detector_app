import 'package:flutter/material.dart';
import 'package:food_app2/reviews.dart';

class InfoPage extends StatelessWidget {
  final String prediction;

  InfoPage({required this.prediction});

  // Define a function to get the nutritional information based on the food prediction
  String getNutritionalInfo(String prediction) {
    // Customize this function to return nutritional info for each food
    switch (prediction) {
      case 'koththu':
        return 'Nutritional Information:\nCalories: 350 kcal\nProtein: 10g\nCarbohydrates: 45g\nFat: 15g';
      case 'roti':
        return 'Nutritional Information:\nCalories: 150 kcal\nProtein: 4g\nCarbohydrates: 30g\nFat: 2g';
      case 'hoppers':
        return 'Nutritional Information:\nCalories: 200 kcal\nProtein: 5g\nCarbohydrates: 35g\nFat: 8g';
      case 'wade':
        return 'Nutritional Information:\nCalories: 120 kcal\nProtein: 3g\nCarbohydrates: 20g\nFat: 4g';
      case 'string hoppers':
        return 'Nutritional Information:\nCalories: 180 kcal\nProtein: 6g\nCarbohydrates: 25g\nFat: 6g';
      case 'milk rice':
        return 'Nutritional Information:\nCalories: 250 kcal\nProtein: 5g\nCarbohydrates: 40g\nFat: 7g';
      default:
        return 'Nutritional Information: Not available';
    }
  }

  // Define a function to get ratings based on the food prediction
  String getRating(String prediction) {
    // Customize this function to return ratings for each food
    switch (prediction) {
      case 'koththu':
        return '4.5';
      case 'roti':
        return '4.2';
      case 'hoppers':
        return '4.8';
      case 'wade':
        return '4.0';
      case 'string hoppers':
        return '4.6';
      case 'milk rice':
        return '4.3';
      default:
        return 'N/A';
    }
  }

  String getPrice(String prediction) {
    // Customize this function to return ratings for each food
    switch (prediction) {
      case 'koththu':
        return '600 lkr';
      case 'roti':
        return '40 lkr';
      case 'hoppers':
        return '30lkr';
      case 'wade':
        return '20 lkr';
      case 'string hoppers':
        return '150 lkr per plate';
      case 'milk rice':
        return '100 lkr per plate';
      default:
        return 'N/A';
    }
  }

  // Function to generate star icons based on the rating
  List<Widget> generateStarIcons(String rating) {
    double ratingValue = double.tryParse(rating) ?? 0.0;
    List<Widget> stars = [];

    for (int i = 0; i < 5; i++) {
      if (ratingValue >= (i + 1)) {
        // Full star
        stars.add(const Icon(
          Icons.star,
          color: Colors.amber,
          size: 24,
        ));
      } else if (ratingValue > i) {
        // Half star
        stars.add(const Icon(
          Icons.star_half,
          color: Colors.amber,
          size: 24,
        ));
      } else {
        // Empty star
        stars.add(const Icon(
          Icons.star_border,
          color: Colors.amber,
          size: 24,
        ));
      }
    }

    return stars;
  }

  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/'; // Set the image path based on the prediction
    String title = ''; // Set the title based on the prediction
    String description = ''; // Set the description based on the prediction
    String ingredients = ''; // Set the ingredients based on the prediction
    String cookingInstructions =
        ''; // Set the cooking instructions based on the prediction
    String nutritionalInfo =
        getNutritionalInfo(prediction); // Get nutritional info
    String rating = getRating(prediction);
    String price = getPrice(prediction); // Get rating

    // Customize image, title, description, ingredients, cooking instructions, and nutritional information based on the prediction
    switch (prediction) {
      case 'koththu':
        imagePath = 'assets/koththu.jpeg';
        title = 'Koththu';
        description =
            'Koththu is a popular Sri Lankan dish made with chopped roti, vegetables, and spices. It is known for its savory and flavorful taste, often enjoyed as a street food.';
        ingredients = 'Ingredients:\n1. Roti\n2. Vegetables\n3. Spices';
        cookingInstructions =
            'Cooking Instructions:\n1. Chop roti into small pieces.\n2. Stir-fry with vegetables and spices.\n3. Serve hot.';
        break;
      case 'roti':
        imagePath = 'assets/roti.jpg';
        title = 'Roti';
        description =
            'Roti is a type of unleavened flatbread commonly enjoyed in Sri Lanka. It is a versatile dish that can be served with various curries and accompaniments.';
        ingredients = 'Ingredients:\n1. Wheat flour\n2. Water\n3. Salt';
        cookingInstructions =
            'Cooking Instructions:\n1. Knead the dough.\n2. Roll into flatbread.\n3. Cook on a griddle until golden brown.';
        break;
      case 'hoppers':
        imagePath = 'assets/hoppers.jpg';
        title = 'Hoppers';
        description =
            'Hoppers are a traditional Sri Lankan pancake-like dish made from rice flour and coconut milk. They come in different varieties, including egg hoppers and plain hoppers.';
        ingredients = 'Ingredients:\n1. Rice flour\n2. Coconut milk\n3. Yeast';
        cookingInstructions =
            'Cooking Instructions:\n1. Prepare the batter.\n2. Pour into a hopper pan.\n3. Cook until edges are crispy.';
        break;
      case 'wade':
        imagePath = 'assets/wade.jpg';
        title = 'Wade (Vadai)';
        description =
            'Wade, or vadai, are deep-fried lentil fritters often served as snacks in Sri Lanka. They are crispy on the outside and soft on the inside, making them a popular street food.';
        ingredients =
            'Ingredients:\n1. Urad dal (lentils)\n2. Onions\n3. Green chilies\n4. Spices';
        cookingInstructions =
            'Cooking Instructions:\n1. Soak lentils, grind to a paste.\n2. Mix with onions, chilies, and spices.\n3. Deep fry until golden brown.';
        break;
      case 'string hoppers':
        imagePath = 'assets/string hoppers.png';
        title = 'String Hoppers';
        description =
            'String hoppers are thin rice noodles often served with curries in Sri Lanka. They are steamed to perfection and are a common part of Sri Lankan cuisine.';
        ingredients = 'Ingredients:\n1. Rice flour\n2. Hot water\n3. Salt';
        cookingInstructions =
            'Cooking Instructions:\n1. Make a dough, press through a string hopper press.\n2. Steam until cooked.\n3. Serve with curries.';
        break;
      case 'milk rice':
        imagePath = 'assets/milk rice.png';
        title = 'Milk Rice';
        description =
            'Milk rice is a traditional Sri Lankan dish made from rice and coconut milk, often served during festivals and special occasions. It has a creamy and rich texture.';
        ingredients = 'Ingredients:\n1. Rice\n2. Coconut milk\n3. Salt';
        cookingInstructions =
            'Cooking Instructions:\n1. Cook rice with coconut milk and salt.\n2. Let it set, then cut into squares.\n3. Serve as a sweet or savory dish.';
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
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SourceSans3-Regular'),
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
            // Ingredients Card
            Row(
              children: [
                Expanded(
                  child: Card(
                    margin: EdgeInsets.all(16),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Ingredients',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            ingredients,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Nutritional Information Card
            Row(
              children: [
                Expanded(
                  child: Card(
                    margin: EdgeInsets.all(16),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nutritional Information',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            nutritionalInfo,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Cooking Instructions Card
            Row(
              children: [
                Expanded(
                  child: Card(
                    margin: EdgeInsets.all(16),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Cooking Instructions',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            cookingInstructions,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Ratings Card
            Row(
              children: [
                Expanded(
                  child: Card(
                    margin: EdgeInsets.all(16),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Rating',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: generateStarIcons(rating),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    margin: EdgeInsets.all(16),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Max Price',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            price,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the InfoPage
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.amber, // Customize the button color
                      foregroundColor: Colors.white,
                      elevation: 5, // Customize the text color
                    ),
                    child: Text('Back'),
                  ),
                ),
                SizedBox(width: 8), // Add some spacing between the buttons
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ReviewsPage(prediction: prediction),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.amber, // Customize the button color
                      foregroundColor: Colors.white,
                      elevation: 5, // Customize the text color
                    ),
                    child: Text('View Reviews'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
