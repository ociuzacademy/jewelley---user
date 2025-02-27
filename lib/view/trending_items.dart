import 'package:flutter/material.dart';

class TrendingItems extends StatefulWidget {
  const TrendingItems({super.key});

  @override
  _TrendingItemsState createState() => _TrendingItemsState();
}

class _TrendingItemsState extends State<TrendingItems> {
  final List<Map<String, String>> trendingItems = [
    {"name": "Gold Necklace", "price": "\$250", "image": "assets/images/image1.jpg"},
    {"name": "Platinum Ring", "price": "\$450", "image": "assets/images/image2.jpg"},
    {"name": "Silver Bracelet", "price": "\$150", "image": "assets/images/image3.jpg"},
    {"name": "Diamond Earrings", "price": "\$600", "image": "assets/images/image4.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Trending Jewelry")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemCount: trendingItems.length,
          itemBuilder: (context, index) {
            final item = trendingItems[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JewelryDetailScreen(
                      name: item["name"]!,
                      price: item["price"]!,
                      imageUrl: item["image"]!,
                    ),
                  ),
                );
              },
              child: JewelryItem(
                name: item["name"]!,
                price: item["price"]!,
                imageUrl: item["image"]!,
              ),
            );
          },
        ),
      ),
    );
  }
}

class JewelryItem extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;

  const JewelryItem({
    required this.name,
    required this.price,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(imageUrl, fit: BoxFit.cover, width: double.infinity),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(price, style: TextStyle(fontSize: 14, color: Colors.green)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class JewelryDetailScreen extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;

  const JewelryDetailScreen({
    required this.name,
    required this.price,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(imageUrl, fit: BoxFit.cover, width: double.infinity),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(price, style: TextStyle(fontSize: 18, color: Colors.green)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Buy Now"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
