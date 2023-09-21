import 'package:flutter/material.dart';

class AddReviewPage extends StatefulWidget {
  final String prediction;

  AddReviewPage({required this.prediction});

  @override
  _AddReviewPageState createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Review - ${widget.prediction}'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Add a Review for ${widget.prediction}:',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: reviewController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Your Review',
                hintText: 'Share your thoughts about ${widget.prediction}...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      final newReview = reviewController.text;
                      if (newReview.isNotEmpty) {
                        // Pass the new review back to the previous screen (ReviewsPage).
                        Navigator.pop(context, newReview);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.white,
                      elevation: 5, // Text color
                      padding: EdgeInsets.all(16),
                    ),
                    child: Text(
                      'Submit Review',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the TextEditingController when the widget is disposed.
    reviewController.dispose();
    super.dispose();
  }
}
