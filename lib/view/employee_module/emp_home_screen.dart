import 'package:flutter/material.dart';

class EmployeeHomeScreen extends StatelessWidget {
  const EmployeeHomeScreen({super.key});

  final List<Map<String, dynamic>> userRequests = const [
    {
      "name": "John Doe",
      "email": "john@example.com",
      "purchasedItems": [
        {"name": "Gold Necklace", "price": "\$800"},
        {"name": "Silver Bracelet", "price": "\$150"},
      ],
      "status": "Pending"
    },
    {
      "name": "Jane Smith",
      "email": "jane@example.com",
      "purchasedItems": [
        {"name": "Platinum Ring", "price": "\$1200"},
      ],
      "status": "Pending"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Requests"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: userRequests.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(userRequests[index]["name"]),
            subtitle: Text(userRequests[index]["email"]),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailsPage(user: userRequests[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class UserDetailsPage extends StatefulWidget {
  final Map<String, dynamic> user;
  const UserDetailsPage({super.key, required this.user});

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  bool isInStore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user["name"]),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email: ${widget.user["email"]}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("Purchased Items:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: widget.user["purchasedItems"].length,
                itemBuilder: (context, index) {
                  var item = widget.user["purchasedItems"][index];
                  return ListTile(
                    title: Text(item["name"]),
                    subtitle: Text("Price: ${item["price"]}"),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isInStore = !isInStore;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isInStore ? Colors.red : Colors.green,
              ),
              child: Text(isInStore ? "User Left Store" : "User Entered Store"),
            ),
          ],
        ),
      ),
    );
  }
}