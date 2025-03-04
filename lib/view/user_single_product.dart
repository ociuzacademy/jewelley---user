import 'package:flutter/material.dart';

class JewelryProductPage extends StatefulWidget {
  const JewelryProductPage({super.key});

  @override
  _JewelryProductPageState createState() => _JewelryProductPageState();
}

class _JewelryProductPageState extends State<JewelryProductPage> {
  String selectedSize = '8';
  final List<String> sizes = ['8', '9', '10', '11', '12'];
  String selectedWeight = '10g';
  final List<String> weights = ['5g', '10g', '15g', '20g'];
  int quantity = 1;//not changed
  double pricePerItem = 1200;
  double totalPrice = 1200;

  final TextEditingController _quantityController = TextEditingController();

  final List<String> imageList = [
    "assets/images/jewel1.webp",
    "assets/images/jewel2.webp",
    "assets/images/jewel3.webp"
  ];

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
      "weight": selectedWeight,
      "quantity": quantity,
      "total_price": totalPrice,
    };

    await Future.delayed(const Duration(seconds: 2));
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
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(imageList[index], height: 300, fit: BoxFit.cover),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Gold Necklace",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            const SizedBox(height: 10),
            const Text(
              "A stunning 22K gold necklace with intricate designs, perfect for special occasions.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            const Text("Select Size", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
            const SizedBox(height: 10),
            Wrap(
              children: sizes.map((size) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSize = size;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: selectedSize == size ? Colors.deepPurple : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      size,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: selectedSize == size ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text("Select Weight", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
            const SizedBox(height: 10),
            Wrap(
              children: weights.map((weight) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedWeight = weight;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: selectedWeight == weight ? Colors.deepPurple : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      weight,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: selectedWeight == weight ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Text(
              "Total Price: \$${totalPrice.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            const SizedBox(height: 30),
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
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
