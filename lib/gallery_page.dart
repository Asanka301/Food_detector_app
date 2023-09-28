import 'package:flutter/material.dart';
import 'package:food_app2/home.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  int _selectedCategory = 0; // Track the selected category
  List<String> categories = [
    'Koththu',
    'Hoppers',
    'Roti',
    'Milk Rice',
    'Wade',
    'String Hoppers',
  ];

  // Define sample image URLs for each category (you can replace these with your own images)
  Map<int, List<String>> categoryImages = {
    0: [
      'assets/1.jpg',
      'assets/2.jpg',
      'assets/3.jpg',
      'assets/4.jpg',
      'assets/1.jpg',
      'assets/2.jpg',
      'assets/3.jpg',
      'assets/4.jpg',
    ],
    1: [
      'assets/5.jpg',
      'assets/6.jpg',
      'assets/7.jpg',
      'assets/8.jpg',
      'assets/5.jpg',
      'assets/6.jpg',
      'assets/7.jpg',
      'assets/8.jpg',
    ],
    2: [
      'assets/9.jpg',
      'assets/10.jpg',
      'assets/11.jpg',
      'assets/12.jpg',
      'assets/9.jpg',
      'assets/10.jpg',
      'assets/11.jpg',
      'assets/12.jpg',
    ],
    3: [
      'assets/13.png',
      'assets/14.jpg',
      'assets/15.jpg',
      'assets/16.jpg',
      'assets/13.png',
      'assets/14.jpg',
      'assets/15.jpg',
      'assets/16.jpg',
    ],
    4: [
      'assets/17.jpg',
      'assets/18.jpg',
      'assets/19.jpg',
      'assets/20.jpg',
      'assets/17.jpg',
      'assets/18.jpg',
      'assets/19.jpg',
      'assets/20.jpg',
    ],
    5: [
      'assets/21.jpg',
      'assets/22.jpg',
      'assets/23.jpg',
      'assets/24.jpeg',
      'assets/21.jpg',
      'assets/22.jpg',
      'assets/23.jpg',
      'assets/24.jpeg',
    ],

    // Define images for other categories similarly
  };
  // Handle navigation to the Home page
  void _navigateToHome() {
    Navigator.of(context).pushReplacementNamed('/main');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        backgroundColor: Colors.teal[600],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Cards for selecting categories in two columns
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: categories
                  .asMap()
                  .entries
                  .map(
                    (entry) => Card(
                      color: _selectedCategory == entry.key
                          ? Colors.teal[600]
                          : Colors.white,
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedCategory = entry.key;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              entry.value,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          // Images grid
          Expanded(
            child: GridView.builder(
              itemCount: categoryImages[_selectedCategory]?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
              ),
              itemBuilder: (context, index) {
                final assetPath =
                    categoryImages[_selectedCategory]?[index] ?? '';
                return Card(
                  child: Image.asset(
                    assetPath,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Gallery',
          ),
        ],
        currentIndex: 1, // Set the current index to 1 for Gallery
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          }
        },
      ),
    );
  }
}
