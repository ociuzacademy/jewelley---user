import 'package:flutter/material.dart';
import 'package:jewellery_app/view/employee_module/view_user_details.dart';

class UserRequestPage extends StatelessWidget {
  final List<Map<String, String>> userRequests = [
    {
      "name": "John Doe",
      "phone": "123-456-7890",
      "email": "john.doe@example.com",
      "address": "123 Main Street, City, Country",
      "advancePayment": "₹5,000",
      "status": "Request"
    },
    {
      "name": "Jane Smith",
      "phone": "987-654-3210",
      "email": "jane.smith@example.com",
      "address": "456 Oak Avenue, City, Country",
      "advancePayment": "₹8,000",
      "status": "Request"
    }
  ];

  UserRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Requests",style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 87, 3, 82),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: userRequests.length,
        itemBuilder: (context, index) {
          final request = userRequests[index];
          return GestureDetector(
            onTap: () {
              // Handle card tap event
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailsPage(),
                ),
              );
            },
            child: Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name: ${request["name"]}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text("Phone: ${request["phone"]}"),
                    Text("Email: ${request["email"]}"),
                    Text("Address: ${request["address"]}"),
                    Text("Advance Payment: ${request["advancePayment"]}"),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {},
                        child: Text(request["status"]!),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
