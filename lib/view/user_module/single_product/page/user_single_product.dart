import 'package:flutter/material.dart';
import 'package:jewellery_app/view/constants/urls.dart';
import 'package:jewellery_app/view/user_checkout_page.dart';
import 'package:jewellery_app/view/user_module/single_product/service/respones_single_service.dart';
import 'package:jewellery_app/view/user_module/single_product/service/single_product_service.dart';

class JewelryProductPage extends StatefulWidget {
  final String productId;
  const JewelryProductPage({
    super.key,
    required this.productId,
  });

  @override
  _JewelryProductPageState createState() => _JewelryProductPageState();
}

class _JewelryProductPageState extends State<JewelryProductPage>
    with AutomaticKeepAliveClientMixin {
  String? selectedSize;
  String? selectedWeight;
  int quantity = 1;
  final TextEditingController _quantityController = TextEditingController();
  Future<dynamic>? _future; // Declare _future as nullable

  @override
  bool get wantKeepAlive => true; // Preserve state when navigating back

  @override
  void initState() {
    super.initState();
    _quantityController.text = quantity.toString();
    _future = singleProductService(
        product_id: widget.productId); // Initialize _future
  }

  void validateAndBook(int stock) {
    if (selectedSize == null ||
        selectedWeight == null ||
        quantity <= 0 ||
        quantity > stock) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Please select valid options before booking.")),
      );
      return;
    }
    _buyProduct();
  }

// futute for post method
  Future<void> _buyProduct() async {
    try {
      final responseMessage = await buyProductService(
        product_id: widget.productId,
        quantity: quantity.toString(),
        size: selectedSize.toString(),
        weight: selectedWeight.toString(),
      );
      
      if (responseMessage.status == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product Booked')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CheckoutScreen(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseMessage.message ?? "Unkown error")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product purchase failed: $e')),
      );
    }
  }

  void addToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Item added to cart!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Ensure the mixin is used
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jewelry Details",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: _future, // Use _future here
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  Image.asset('assets/images/noResponse.jpg'),
                  Text("Error: ${snapshot.error}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: Text("No service found"));
          }

          final singleitem = snapshot.data;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: singleitem!.images!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                              '${UserUrl.baseUrl}/${singleitem.images![index]}',
                              height: 300,
                              fit: BoxFit.cover),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  singleitem.name!,
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                ),
                const SizedBox(height: 10),
                Text(singleitem.description!,
                    style:
                        const TextStyle(fontSize: 16, color: Colors.black87)),
                const SizedBox(height: 20),
                const Text("Select Size",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Wrap(
                  children: singleitem.sizes!.map<Widget>((size) {
                    return GestureDetector(
                      onTap: () => setState(() => selectedSize = size),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
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
                  children: singleitem.weights!.map<Widget>((weight) {
                    return GestureDetector(
                      onTap: () =>
                          setState(() => selectedWeight = weight.toString()),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
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
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Select Quantity",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    if (singleitem.stock! > 0)
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: quantity > 1
                                ? () => setState(() => quantity--)
                                : null,
                          ),
                          Text(quantity.toString(),
                              style: const TextStyle(fontSize: 18)),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: quantity < singleitem.stock!
                                ? () => setState(() => quantity++)
                                : null,
                          ),
                          Text(" / ${singleitem.stock!} available"),
                        ],
                      )
                    else
                      const Text("Out of Stock",
                          style: TextStyle(fontSize: 18, color: Colors.red)),
                    const SizedBox(height: 20),
                    Text(
                      "Total Price: \$${(double.parse(singleitem.price!) * quantity).toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: singleitem.stock! > 0
                              ? () => validateAndBook(singleitem.stock!)
                              : null,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange),
                          child: const Text("Book Now",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                        const SizedBox(width: 50),
                        ElevatedButton(
                          onPressed: addToCart,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          child: const Text("Add to Cart",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
