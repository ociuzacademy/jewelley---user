import 'package:flutter/material.dart';

class JewelryProductPage extends StatefulWidget {
  const JewelryProductPage({super.key});

  @override
  _JewelryProductPageState createState() => _JewelryProductPageState();
}

class _JewelryProductPageState extends State<JewelryProductPage> {
  String selectedSize = 'Small';
  final List<String> sizes = ['8', '9', '10','11','12',];
  int quantity = 1;
  double pricePerItem = 1200;
  double totalPrice = 1200;

  final TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _quantityController.text = quantity.toString();
  }

  void updatePrice() {
    setState(() {
      totalPrice = pricePerItem * quantity;
      _quantityController.text = quantity.toString();
    });
  }

  Future<void> submitOrder() async {
    final Map<String, dynamic> orderData = {
      "product": "Gold Necklace",
      "size": selectedSize,
      "quantity": quantity,
      "total_price": totalPrice,
    };

    // Simulating a POST request with a delay
    await Future.delayed(const Duration(seconds: 2));
    
    // Print output to console (Replace this with actual HTTP POST request)
    debugPrint("Order Submitted: $orderData");
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Order Submitted Successfully")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jewelry Details", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset("assets/images/offer.webp", height: 300, fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Gold Necklace",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            const SizedBox(height: 10),
            const Text(
              "A stunning 22K gold necklace with intricate designs, perfect for special occasions.A stunning 22K gold necklace with intricate designs, perfect for special occasions.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            // const Text("Gold Karat: 22K", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
            // const SizedBox(height: 20),

            // Size Selection (Horizontal List)
            const Text("Select Size", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sizes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSize = sizes[index];
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: selectedSize == sizes[index] ? Colors.deepPurple : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        sizes[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: selectedSize == sizes[index] ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Quantity Selector
            // const Text("Quantity:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
            // const SizedBox(height: 10),
            Row(
              children: [
                const Text("Quantity ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                IconButton(
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                        updatePrice();
                      });
                    }
                  },
                  icon: const Icon(Icons.remove_circle_outline_rounded, color: Colors.deepPurple),
                  splashRadius: 20,
                ),
                SizedBox(
                  width: 50,
                  child: TextField(
                    controller: _quantityController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    onSubmitted: (value) {
                      int? newQuantity = int.tryParse(value);
                      if (newQuantity != null && newQuantity > 0) {
                        setState(() {
                          quantity = newQuantity;
                          updatePrice();
                        });
                      } else {
                        _quantityController.text = quantity.toString();
                      }
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                      updatePrice();
                    });
                  },
                  icon: const Icon(Icons.add_circle_outline, color: Colors.deepPurple),
                  splashRadius: 20,
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Updated Price
            Text(
              "Total Price: \$${totalPrice.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),

            const SizedBox(height: 30),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    submitOrder();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Add to Cart", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                ElevatedButton(
                  onPressed: () {
                    submitOrder();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Book Now", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
