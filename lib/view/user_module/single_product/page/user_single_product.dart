import 'package:flutter/material.dart';

class JewelryProductPage extends StatefulWidget {
  //final int productId;
  const JewelryProductPage({
    super.key,
  });

  @override
  _JewelryProductPageState createState() => _JewelryProductPageState();
}

class _JewelryProductPageState extends State<JewelryProductPage> {
  final Map<String, dynamic> productData = {
    "id": 1,
    "category_name": "Gold",
    "subcategory": "Bangles",
    "name": "Gold Bangle",
    "description":
        "Indulge in the divine elegance of the Goddess Lakshmi Kasu Overlapping Bangle, an exquisite masterpiece crafted in 22 karat yellow gold. This intricately designed temple jewelry piece beautifully showcases sacred Kasu coins featuring the revered Goddess Lakshmi, symbolizing prosperity and good fortune. Weighing 7.61 grams, this bangle seamlessly blends tradition with sophistication, making it an ideal choice for ethnic and festive occasions. Its 60.00 mm size ensures a comfortable yet regal fit, adorning your wrist with a touch of heritage and grace. Part of the Shagun Collection by Tanishq, this bangle is a timeless treasure for women who appreciate the richness of gold craftsmanship.",
    "price": 75011.00,
    "stock": 10,
    "main_image": "media/product_images/bangle9_Yi55vqn.jpeg",
    "images": [
      "product_images/bangle8_g8jaeHR.jpeg",
      "product_images/bangle7_OraPhUT.jpeg"
    ],
    "sizes": ["60", "65"],
    "weights": [7.61, 7.64]
  };

  String? selectedSize;
  String? selectedWeight;
  int quantity = 1;
  final TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _quantityController.text = quantity.toString();
  }

  void validateAndBook() {
    if (selectedSize == null ||
        selectedWeight == null ||
        quantity <= 0 ||
        quantity > productData['stock']) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Please select valid options before booking.")),
      );
      return;
    }
    submitOrder();
  }

  Future<void> submitOrder() async {
    final orderData = {
      "product": productData['name'],
      "size": selectedSize,
      "weight": selectedWeight,
      "quantity": quantity,
      "total_price": productData['price'] * quantity,
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
        title: const Text("Jewelry Details",
            style: TextStyle(color: Colors.white)),
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
                itemCount: productData['images'].length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(productData['images'][index],
                          height: 300, fit: BoxFit.cover),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              productData['name'],
              style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
            const SizedBox(height: 10),
            Text(productData['description'],
                style: const TextStyle(fontSize: 16, color: Colors.black87)),
            const SizedBox(height: 20),
            const Text("Select Size",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            Wrap(
              children: productData['sizes'].map<Widget>((size) {
                return GestureDetector(
                  onTap: () => setState(() => selectedSize = size),
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: selectedSize == size
                          ? Colors.deepPurple
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(size,
                        style: TextStyle(
                            color: selectedSize == size
                                ? Colors.white
                                : Colors.black)),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text("Select Weight",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            Wrap(
              children: productData['weights'].map<Widget>((weight) {
                return GestureDetector(
                  onTap: () =>
                      setState(() => selectedWeight = weight.toString()),
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: selectedWeight == weight.toString()
                          ? Colors.deepPurple
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(weight.toString(),
                        style: TextStyle(
                            color: selectedWeight == weight.toString()
                                ? Colors.white
                                : Colors.black)),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Text(
                "Total Price: \$${(productData['price'] * quantity).toStringAsFixed(2)}",
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple)),
            const SizedBox(height: 30),
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Quantity", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            if (productData['stock'] > 0)
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: quantity > 1 ? () => setState(() => quantity--) : null,
                  ),
                  Text(quantity.toString(), style: const TextStyle(fontSize: 18)),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: quantity < productData['stock']
                        ? () => setState(() => quantity++)
                        : null,
                  ),
                  Text(" / ${productData['stock']} available"),
                ],
              )
            else
              const Text("Out of Stock", style: TextStyle(fontSize: 18, color: Colors.red)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: productData['stock'] > 0 ? validateAndBook : null,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
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
