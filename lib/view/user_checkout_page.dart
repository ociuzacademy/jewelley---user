import 'package:flutter/material.dart';
import 'package:jewellery_app/view/user_paymet.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController deliveryAddressController = TextEditingController();
  TextEditingController billingAddressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  final double subtotal = 850.0; // Example subtotal value
  final double shippingFee = 0.05 * 850; // 5% of subtotal
  final double platformFee = 0.05 * 850; // 5% of subtotal
  double get totalAmount => subtotal + shippingFee + platformFee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 78, 2, 91),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // **Price Summary**
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Order Summary",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    summaryRow("Subtotal", "\u{20B9}${subtotal.toStringAsFixed(2)}"),
                    summaryRow("Shipping Fee (5%)", "\u{20B9}${shippingFee.toStringAsFixed(2)}"),
                    summaryRow("Platform Fee (5%)", "\u{20B9}${platformFee.toStringAsFixed(2)}"),
                    const Divider(),
                    summaryRow("Total Amount", "\u{20B9}${totalAmount.toStringAsFixed(2)}",
                        isBold: true),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // **Checkout Form**
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextAreaField(
                      controller: deliveryAddressController,
                      label: "Delivery Address",
                      hint: "Enter your delivery address"),
                  const SizedBox(height: 16),
                  buildTextAreaField(
                      controller: billingAddressController,
                      label: "Billing Address",
                      hint: "Enter your billing address"),
                  const SizedBox(height: 16),
                  buildPincodeField(),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Proceed with checkout
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(content: Text("Order Placed Successfully!")),
                          // )1;
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UserPaymet()));
                          
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                        backgroundColor: const Color.fromARGB(255, 78, 2, 91),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text("Confirm Order", style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget summaryRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value, style: TextStyle(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  Widget buildTextAreaField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: 3,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$label is required.";
        }
        return null;
      },
    );
  }

  Widget buildPincodeField() {
    return TextFormField(
      controller: pincodeController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Pincode",
        hintText: "Enter your pincode",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Pincode is required.";
        } else if (value.length != 6 || int.tryParse(value) == null) {
          return "Enter a valid 6-digit pincode.";
        }
        return null;
      },
    );
  }
}
