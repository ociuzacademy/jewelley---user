import 'package:flutter/material.dart';

class UserPayment extends StatefulWidget {
  final String total_price;

  const UserPayment({super.key, required this.total_price});

  @override
  UserPaymentState createState() => UserPaymentState();
}

class UserPaymentState extends State<UserPayment> {
  String? selectedBank;
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController upiController = TextEditingController();

  final List<Map<String, String>> banks = [
    {
      'name': 'Google Pay',
      'image': 'assets/icons/google-pay-icon.webp',
    },
    {
      'name': 'Credit/Debit Cards',
      'image': 'assets/icons/credit_card.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    selectedBank = 'Credit/Debit Cards'; // Default selection
    pricecontroller.text = "₹${widget.total_price}"; // Set fixed total price
  }

  void _showPaymentSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: selectedBank == 'Google Pay' ? _buildGooglePayForm() : _buildCardPaymentForm(),
        );
      },
    );
  }

  Widget _buildCardPaymentForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Enter Card Details",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildTextField(controller: cardNumberController, label: "Card Number"),
        _buildTextField(controller: nameController, label: "Cardholder Name"),
        Row(
          children: [
            Expanded(child: _buildTextField(controller: expiryDateController, label: "Expiry Date (MM/YY)")),
            const SizedBox(width: 10),
            Expanded(child: _buildTextField(controller: cvvController, label: "CVV", obscureText: true)),
          ],
        ),
        const SizedBox(height: 20),
        _buildSubmitButton(),
      ],
    );
  }

  Widget _buildGooglePayForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Enter UPI ID for Google Pay",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildTextField(controller: upiController, label: "UPI ID"),
        const SizedBox(height: 20),
        _buildSubmitButton(),
      ],
    );
  }

  Widget _buildTextField({required TextEditingController controller, required String label, bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Payment processing...")),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.red,
        ),
        child: const Text("Submit Payment", style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Payment Option",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, size: 20, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: pricecontroller,
              textAlign: TextAlign.center,
              readOnly: true,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Choose Your Payment Method",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    const SizedBox(height: 15),
                    DropdownButtonFormField<String>(
                      value: selectedBank,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      ),
                      items: banks.map((bank) {
                        return DropdownMenuItem<String>(
                          value: bank['name'],
                          child: Row(
                            children: [
                              Image.asset(bank['image']!, width: 30, height: 30),
                              const SizedBox(width: 10),
                              Text(bank['name']!, style: const TextStyle(fontSize: 14)),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedBank = newValue;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _showPaymentSheet,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
                          'Proceed to Payment',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
