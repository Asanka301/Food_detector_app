import 'package:flutter/material.dart';
import 'package:food_app2/addReview.dart';

class ReviewsPage extends StatefulWidget {
  final String prediction;

  ReviewsPage({required this.prediction});

  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  List<String> reviews = [];

  @override
  void initState() {
    super.initState();
    // Initialize pre-built reviews based on the food prediction.
    switch (widget.prediction) {
      case 'koththu':
        reviews.addAll([
          'I have had koththu multiple times, and it never disappoints. The perfect comfort food.',
          'Koththu is a must-try dish in Sri Lanka! It has an amazing blend of flavors.',
          'Very good but spicy',
        ]);
        break;
      case 'roti':
        reviews.addAll([
          'Roti is a staple in Sri Lankan cuisine. It\'s simple yet delicious.',
          'I love how versatile roti is. You can pair it with various curries or eat it plain!',
          'A nice dish and good for the price',
        ]);
        break;
      case 'hoppers':
        reviews.addAll([
          'Hoppers are a unique Sri Lankan dish. They have a delightful texture and flavor.',
          'I tried egg hoppers once, and I can\'t get enough of them. A fantastic breakfast option!',
          'Very delicious and healthy',
        ]);
        break;
      case 'wade':
        reviews.addAll([
          'Wade is my go-to snack when I visit Sri Lanka. It\'s crispy and full of flavor.',
          'You can find wade at almost every street corner in Sri Lanka. It\'s that popular!',
          'A best street food in South Asia...',
        ]);
        break;
      case 'string hoppers':
        reviews.addAll([
          'String hoppers are a great accompaniment to curries. They soak up all the flavors.',
          'I had string hoppers with chicken curry, and it was a match made in heaven.',
          'Wow Good for breakfast',
        ]);
        break;
      case 'milk rice':
        reviews.addAll([
          'Milk rice is a delightful dish, especially when served sweet with jaggery.',
          'During festivals, milk rice is a must-have. It has a rich and creamy taste.',
          'healthy food for anyone',
        ]);
        break;
      default:
        break;
    }
  }

  void _addReview(String newReview) {
    setState(() {
      reviews.add(newReview);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews - ${widget.prediction}'),
        backgroundColor: Colors.teal[600],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Reviews for ${widget.prediction}:',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'SourceSans3-Regular',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                return ReviewWidget(
                    author: 'User ${index + 1}', text: reviews[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () async {
                // Navigate to a new page to add a review.
                final newReview = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AddReviewPage(prediction: widget.prediction),
                  ),
                );

                if (newReview != null) {
                  _addReview(newReview);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[600], // Customize the button color
                foregroundColor: Colors.white,
                elevation: 5, // Customize the text color
              ),
              child: const Text('Add Review'),
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  final String author;
  final String text;

  const ReviewWidget({required this.author, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      child: ListTile(
        leading: const Icon(Icons.account_circle, size: 48),
        title: Text(
          author,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
