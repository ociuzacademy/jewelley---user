import 'package:flutter/material.dart';
import 'package:jewellery_app/view/user_checkout_page.dart';

class UserCartScreen extends StatefulWidget {
  const UserCartScreen({super.key});

  @override
  _UserCartScreenState createState() => _UserCartScreenState();
}

class _UserCartScreenState extends State<UserCartScreen> {
  final List<Map<String, dynamic>> cartItems = [
    {
      "name": "Gold Necklace",
      "price": 250,
      "image": "assets/images/image1.jpg",
      "quantity": 1
    },
    {
      "name": "Platinum Ring",
      "price": 450,
      "image": "assets/images/image1.jpg",
      "quantity": 1
    },
    {
      "name": "Silver Bracelet",
      "price": 150,
      "image": "assets/images/image1.jpg",
      "quantity": 1
    },
  ];

  double getTotalPrice() {
    return cartItems.fold(0, (sum, item) => sum + (item["price"] * item["quantity"]));
  }

  void updateQuantity(int index, int change) {
    setState(() {
      cartItems[index]["quantity"] += change;
      if (cartItems[index]["quantity"] < 1) {
        cartItems[index]["quantity"] = 1;
      }
    });
  }

  void deleteItem(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Remove Item"),
        content: const Text("Are you sure you want to remove this item from your cart?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                cartItems.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 78, 2, 91),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 227, 223, 229), Color.fromARGB(255, 237, 232, 236)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 215, 198, 215), 
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            cartItems[index]["image"],
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cartItems[index]["name"],
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove_circle_outline, color: Color.fromARGB(255, 78, 2, 91),),
                                    onPressed: () => updateQuantity(index, -1),
                                  ),
                                  Text(cartItems[index]["quantity"].toString(),
                                      style: const TextStyle(fontSize: 18)),
                                  IconButton(
                                    icon: const Icon(Icons.add_circle_outline, color: Color.fromARGB(255, 78, 2, 91),),
                                    onPressed: () => updateQuantity(index, 1),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "\u{20B9}${(cartItems[index]["price"] * cartItems[index]["quantity"]).toStringAsFixed(2)}",
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.grey),
                          onPressed: () => deleteItem(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 // Icon(Icons.currency_rupee_sharp,size: 8,),
                  Text("TOTAL : \u{20B9} ${getTotalPrice().toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      backgroundColor: const Color.fromARGB(255, 78, 2, 91),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text("Checkout", style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
