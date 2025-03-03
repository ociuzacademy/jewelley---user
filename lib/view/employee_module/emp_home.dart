import 'package:flutter/material.dart';

class EmployeeHomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> userRequests = [
    {
      "name": "John Doe",
      "email": "johndoe@example.com",
      "purchasedItems": [
        {"name": "Gold Ring", "price": "\$300"},
        {"name": "Silver Bracelet", "price": "\$150"}
      ],
      "status": "Waiting"
    },
    {
      "name": "Jane Smith",
      "email": "janesmith@example.com",
      "purchasedItems": [
        {"name": "Gold Necklace", "price": "\$800"}
      ],
      "status": "Waiting"
    }
  ];

   EmployeeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Requests", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: userRequests.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetailsPage(userRequests[index]),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 6,
                shadowColor: Colors.deepPurple.withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userRequests[index]["name"],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        userRequests[index]["email"],
                        style: const TextStyle(color: Colors.black54),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Purchased Items:",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          userRequests[index]["purchasedItems"].length,
                          (itemIndex) {
                            var item = userRequests[index]["purchasedItems"][itemIndex];
                            return Text("- ${item["name"]} (${item["price"]})");
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            userRequests[index]["status"],
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class UserDetailsPage extends StatefulWidget {
  final Map<String, dynamic> user;

  const UserDetailsPage(this.user, {super.key});

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  bool isUserInStore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user["name"], style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email: ${widget.user["email"]}",
                style: const TextStyle(fontSize: 16, color: Colors.black87)),
            const SizedBox(height: 10),
            const Text("Purchased Items:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                widget.user["purchasedItems"].length,
                (index) {
                  var item = widget.user["purchasedItems"][index];
                  return Text("- ${item["name"]} (${item["price"]})");
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isUserInStore = !isUserInStore;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isUserInStore ? Colors.red : Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  isUserInStore ? "User Left Store" : "User Entered Store",
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
