import 'package:flutter/material.dart';
import 'package:jewellery_app/view/user_single_product.dart';

class GoldJewelryPage extends StatefulWidget {
  const GoldJewelryPage({super.key});

  @override
  _GoldJewelryPageState createState() => _GoldJewelryPageState();
}

class _GoldJewelryPageState extends State<GoldJewelryPage> {
  String selectedCategory = "All";

  final List<Map<String, String>> jewelryItems = [
    {"name": "Gold Bangle", "category": "Bangles", "image": "assets/images/bangle.jpg", "price": "\$500"},
    {"name": "Gold Necklace", "category": "Necklaces", "image": "assets/images/necklace.jpg", "price": "\$800"},
    {"name": "Gold Ring", "category": "Rings", "image": "assets/images/ring.jpg", "price": "\$300"},
    {"name": "Gold Chain", "category": "Chains", "image": "assets/images/chain.jpg", "price": "\$600"},
    {"name": "Gold Bracelet", "category": "Bangles", "image": "assets/images/bracelet.jpg", "price": "\$450"},
    {"name": "Diamond Ring", "category": "Rings", "image": "assets/images/diamond_ring.jpg", "price": "\$1200"},
  ];

  final List<String> categories = ["All", "Bangles", "Necklaces", "Rings", "Chains"];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredItems = jewelryItems.where((item) =>
      selectedCategory == "All" || item["category"] == selectedCategory
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gold Jewelry", style: TextStyle(color: Colors.deepPurple)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.deepPurple),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Horizontal List for Categories
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ChoiceChip(
                      label: Text(
                        categories[index], 
                        style: const TextStyle(color: Colors.deepPurple),
                      ),
                      selected: selectedCategory == categories[index],
                      onSelected: (bool selected) {
                        setState(() {
                          selectedCategory = categories[index];
                        });
                      },
                      selectedColor: Colors.deepPurple.shade100,
                      backgroundColor: Colors.white,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),

            // Jewelry Grid
            Expanded(
              child: filteredItems.isNotEmpty
                ? GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      return JewelryItem(
                        name: filteredItems[index]["name"]!,
                        price: filteredItems[index]["price"]!,
                        imageUrl: filteredItems[index]["image"]!,
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      "No items found",
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

// Jewelry Item Widget
class JewelryItem extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;

  const JewelryItem({super.key, required this.name, required this.price, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the detail page when tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => JewelryProductPage(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 2),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(imageUrl, fit: BoxFit.cover, width: double.infinity),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                  const SizedBox(height: 5),
                  Text(price, style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

