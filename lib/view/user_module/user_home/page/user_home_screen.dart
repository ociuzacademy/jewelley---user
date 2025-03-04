import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/view/constants/urls.dart';
import 'package:jewellery_app/view/user_module/user_home/model/user_home_model.dart';
import 'package:jewellery_app/view/user_module/user_home/service/user_home_service.dart';
import 'package:jewellery_app/widgets/gold_page.dart';
import 'package:jewellery_app/view/platinum_page.dart';
import 'package:jewellery_app/view/silver_page.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  static final List<Map<String, String>> trendingItems = [
    {
      "name": "Gold Necklace",
      "price": "\$250",
      "image": "assets/images/gold_necklace.jpg"
    },
    {
      "name": "Platinum Ring",
      "price": "\$450",
      "image": "assets/images/platinum_ring.jpg"
    },
    {
      "name": "Silver Bracelet",
      "price": "\$150",
      "image": "assets/images/silver_bracelet.jpg"
    },
    {
      "name": "Diamond Earrings",
      "price": "\$600",
      "image": "assets/images/diamond_earrings.jpg"
    },
  ];

  // static final List<Map<String, dynamic>> categories = [
  //   {"name": "Gold", "icon": Icons.star, "page": const GoldJewelryPage()},
  //   {"name": "Silver", "icon": Icons.circle, "page": const SilverJewelryPage()},
  //   {
  //     "name": "Platinum",
  //     "icon": Icons.diamond,
  //     "page": const PlatinumJewelryPage()
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "JEWELRY STORE",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 78, 2, 91),
            fontSize: 20,
            letterSpacing: 1.2,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.deepPurple),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/background.jpg"), // Add your background image
            fit: BoxFit.cover,
            opacity: 0.2, // Adjust for visibility
          ),
          gradient: LinearGradient(
            colors: [
              Colors.white,
              const Color.fromARGB(255, 178, 126, 180),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.1),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                    hintText: "Search Jewelry...",
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon:
                        const Icon(Icons.search, color: Colors.deepPurple),
                    filled: true,
                    fillColor: Colors.deepPurple.shade50,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Categories Section
    

const Text(
  "Categories",
  style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 78, 2, 91),
  ),
),
const SizedBox(height: 10),
FutureBuilder<List<CategoryListModel>>(
  future: categoryListService(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (snapshot.hasError) {
      return Center(
        child: Column(
          children: [
            Image.asset('assets/images/noResponse.jpg'),
            Text(
              "Error: ${snapshot.error}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }

    if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return const Center(
        child: Text("No service found"),
      );
    }

    List<CategoryListModel> categories = snapshot.data!;

    return Column(
      children: categories.map((category) {
        return Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CachedNetworkImage(
                imageUrl:'${UserUrl.userbaseUrl}/${category.iconUrl!}',
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error, size: 40, color: Colors.red),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              category.name!,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 78, 2, 91),
              ),
            ),
          ],
        );
      }).toList(),
    );
  },
),



              // Trending Items Section
               Text(
                "Trending Ornaments",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 78, 2, 91),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
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
      elevation: 6,
      shadowColor: Colors.deepPurple.withOpacity(0.2),
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
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
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
