import 'package:flutter/material.dart';
import 'package:jewellery_app/view/gold_page.dart';
import 'package:jewellery_app/view/platinum_page.dart';
import 'package:jewellery_app/view/silver_page.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  static final List<Map<String, String>> trendingItems = [
    {
      "name": "Gold Necklace",
      "price": "\$250",
      "image": "assets/images/image1.jpg"
    },
    {
      "name": "Platinum Ring",
      "price": "\$450",
      "image": "assets/images/image1.jpg"
    },
    {
      "name": "Silver Bracelet",
      "price": "\$150",
      "image": "assets/images/image1.jpg"
    },
    {
      "name": "Diamond Earrings",
      "price": "\$600",
      "image": "assets/images/image1.jpg"
    },
  ];

  static final List<Map<String, dynamic>> categories = [
    {"name": "Gold", "icon": Icons.star, "page": const GoldJewelryPage()},
    {"name": "Silver", "icon": Icons.circle, "page": const SilverJewelryPage()},
    {
      "name": "Platinum",
      "icon": Icons.diamond,
      "page": const PlatinumJewelryPage()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("JEWELRY STORE",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
                fontSize: 18)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.deepPurple),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications,
                color: Color.fromARGB(255, 35, 33, 38)),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              style: const TextStyle(color: Colors.grey),
              decoration: InputDecoration(
                hintText: "Search Jewelry...",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search,
                    color: Color.fromARGB(255, 67, 65, 65)),
                filled: true,
                fillColor: Colors.deepPurple.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Categories Section
            const Text("Categories",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 132, 9, 156))),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(categories.length, (index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => categories[index]["page"]),
                        );
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.deepPurple.shade100,
                        child: Icon(
                          categories[index]["icon"],
                          color: Colors.deepPurple,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      categories[index]["name"],
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    ),
                  ],
                );
              }),
            ),
            const SizedBox(height: 20),
            // Trending Items Section
            const Text("Trending Ornaments",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple)),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: trendingItems.length,
                itemBuilder: (context, index) {
                  return JewelryItem(
                    name: trendingItems[index]["name"]!,
                    price: trendingItems[index]["price"]!,
                    imageUrl: trendingItems[index]["image"]!,
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

// Jewelry Item Card
class JewelryItem extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;

  const JewelryItem(
      {super.key,
      required this.name,
      required this.price,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(imageUrl,
                  fit: BoxFit.cover, width: double.infinity),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                const SizedBox(height: 5),
                Text(price,
                    style: const TextStyle(color: Colors.deepPurpleAccent)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
