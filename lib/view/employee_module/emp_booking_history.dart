import 'package:flutter/material.dart';

class EmpBookingHistory extends StatefulWidget {
  const EmpBookingHistory({super.key});

  @override
  _EmpBookingHistoryState createState() => _EmpBookingHistoryState();
}

class _EmpBookingHistoryState extends State<EmpBookingHistory> {
  List<Map<String, dynamic>> dealtCustomers = [
    {
      "name": "John Doe",
      "phone": "123-456-7890",
      "email": "john.doe@example.com",
      "purchasedProducts": [
        {"name": "Gold Necklace", "price": "\$2500", "quantity": "2"},
        {"name": "Platinum Ring", "price": "\$1500", "quantity": "1"},
      ]
    },
    {
      "name": "Alice Smith",
      "phone": "987-654-3210",
      "email": "alice.smith@example.com",
      "purchasedProducts": [
        {"name": "Diamond Bracelet", "price": "\$3200", "quantity": "1"},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Dealt History",style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 87, 3, 82),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: dealtCustomers.length,
          itemBuilder: (context, index) {
            final customer = dealtCustomers[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(customer["name"],
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Phone: ${customer["phone"]}"),
                    Text("Email: ${customer["email"]}"),
                    const SizedBox(height: 10),
                    const Text("Purchased Products:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    ...customer["purchasedProducts"].map<Widget>((product) {
                      return Text("- ${product["name"]} (x${product["quantity"]}) - ${product["price"]}");
                    }).toList(),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 81, 179, 85),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: null, // Button is disabled as it's a permanent "Completed" state
                        child: const Text("Completed"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}