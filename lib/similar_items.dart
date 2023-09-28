import 'package:flutter/material.dart';

class SimilarItemsPage extends StatelessWidget {
  // Define a list of predictions and their corresponding similar items
  final Map<String, List<SimilarItem>> similarItems = {
    'koththu': [
      SimilarItem(name: 'Cheese Koththu', image: 'assets/25.jpg'),
      SimilarItem(name: 'Masala Koththu', image: 'assets/26.jpg'),
      SimilarItem(name: 'Dolphine Koththu ', image: 'assets/27.jpg'),
    ],
    'roti': [
      SimilarItem(name: 'Egg Roti ', image: 'assets/28.jpg'),
      SimilarItem(name: 'Paratha', image: 'assets/29.jpg'),
      SimilarItem(name: 'Kurakkan Roti', image: 'assets/30.jpg'),
    ],
    'wade': [
      SimilarItem(name: 'Ulundu Wade ', image: 'assets/31.jpg'),
      SimilarItem(name: 'Prawn wade', image: 'assets/32.jpg'),
      //SimilarItem(name: 'Kurakkan Roti', image: 'assets/30.jpg'),
    ],
    'hoppers': [
      SimilarItem(name: 'Egg Hoppers ', image: 'assets/33.jpg'),
      SimilarItem(name: 'Sweet Hoppers', image: 'assets/34.jpg'),
      //SimilarItem(name: 'Kurakkan Roti', image: 'assets/30.jpg'),
    ],
    'string hoppers': [
      SimilarItem(name: 'Red String Hoppers ', image: 'assets/35.jpg'),
      //SimilarItem(name: 'Paratha', image: 'assets/29.jpg'),
      //SimilarItem(name: 'Kurakkan Roti', image: 'assets/30.jpg'),
    ],
    'milk rice': [
      SimilarItem(name: 'Mun Kiribath ', image: 'assets/36.jpg'),
      SimilarItem(name: 'Ibul Kiribath', image: 'assets/37.jpg'),
      //SimilarItem(name: 'Kurakkan Roti', image: 'assets/30.jpg'),
    ],
  };

  final String prediction;

  // ignore: use_key_in_widget_constructors
  SimilarItemsPage({required this.prediction});

  @override
  Widget build(BuildContext context) {
    final List<SimilarItem> items = similarItems[prediction] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Similar Items'),
        backgroundColor: Colors.teal[600],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final similarItem = items[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.asset(
                        similarItem.image,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'New',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    similarItem.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price: 200 Lkr',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Rating: 4.5',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SimilarItem {
  final String name;
  final String image;

  SimilarItem({
    required this.name,
    required this.image,
  });
}
