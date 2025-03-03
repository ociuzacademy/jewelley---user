import 'package:flutter/material.dart';

class ViewUserDetailsPage extends StatelessWidget {
  final Map<String, dynamic> userDetails = {
    "name": "John Doe",
    "email": "johndoe@example.com",
    "phone": "9876543210",
    "address": "123 Main Street, City, Country",
    "purchasedProducts": [
      {
        "name": "Gold Necklace",
        "price": "\$2500",
        "quantity": "2",
        "image": "assets/images/gold_necklace.jpg",
        "size": "Medium",
        "purchased": "1"
      },
      {
        "name": "Platinum Ring",
        "price": "\$1500",
        "quantity": "5",
        "image": "assets/images/platinum_ring.jpg",
        "size": "Ring Size 8",
        "purchased": "2"
      }
    ]
  };

  ViewUserDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Details", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Information
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name: ${userDetails['name']}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Email: ${userDetails['email']}", style: const TextStyle(fontSize: 16)),
                    Text("Phone: ${userDetails['phone']}", style: const TextStyle(fontSize: 16)),
                    Text("Address: ${userDetails['address']}", style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Purchased Products
            const Text(
              "Purchased Products",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: userDetails['purchasedProducts'].length,
                itemBuilder: (context, index) {
                  final product = userDetails['purchasedProducts'][index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                product['image'],
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text("Name: ${product['name']}",
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text("Price: ${product['price']}", style: const TextStyle(fontSize: 16)),
                          Text("Quantity Available: ${product['quantity']}",
                              style: const TextStyle(fontSize: 16)),
                          Text("Size: ${product['size']}", style: const TextStyle(fontSize: 16)),
                          Text("Items Purchased: ${product['purchased']}",
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
                        ],
                      ),
                    ),
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
