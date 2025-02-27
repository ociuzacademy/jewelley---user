// import 'package:flutter/material.dart';

// class TrendingItemsGrid extends StatelessWidget {
//   final List<Map<String, String>> trendingItems;
  
//   const TrendingItemsGrid({super.key, required this.trendingItems});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//           childAspectRatio: 0.8,
//         ),
//         itemCount: trendingItems.length,
//         itemBuilder: (context, index) {
//           return JewelryItem(
//             name: trendingItems[index]["name"]!,
//             price: trendingItems[index]["price"]!,
//             imageUrl: trendingItems[index]["image"]!,
//           );
//         },
//       ),
//     );
//   }
// }

// final List<Map<String, String>> trendingItems = [
//   {"name": "Gold Necklace", "price": "\$200", "image": "assets/images/gold_necklace.jpg"},
//   {"name": "Platinum Ring", "price": "\$350", "image": "assets/images/platinum_ring.jpg"},
//   {"name": "Silver Bracelet", "price": "\$120", "image": "assets/images/silver_bracelet.jpg"},
//   {"name": "Diamond Earrings", "price": "\$500", "image": "assets/images/diamond_earrings.jpg"},
//   {"name": "Pearl Pendant", "price": "\$180", "image": "assets/images/pearl_pendant.jpg"},
// ];
