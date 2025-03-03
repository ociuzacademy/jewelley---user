import 'package:flutter/material.dart';

class BookingHistoryScreen extends StatefulWidget {
  const BookingHistoryScreen({super.key});

  @override
  _BookingHistoryScreenState createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  // Booking data
  final List<Map<String, dynamic>> bookingHistory = [
    {
      "date": "15 Feb 2025",
      "amount": 1200,
      "items": [
        {"name": "Gold Necklace", "image": "assets/images/image1.jpg", "price": 500},
        {"name": "Platinum Ring", "image": "assets/images/image1.jpg", "price": 700},
      ],
      "isExpanded": false, // Track expanded state
    },
    {
      "date": "10 Feb 2025",
      "amount": 450,
      "items": [
        {"name": "Silver Bracelet", "image": "assets/images/image1.jpg", "price": 450}
      ],
      "isExpanded": false,
    },
    {
      "date": "5 Feb 2025",
      "amount": 250,
      "items": [
        {"name": "Gold Pendant", "image": "assets/images/image1.jpg", "price": 250}
      ],
      "isExpanded": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking History",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 78, 2, 91),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 227, 223, 229), Color.fromARGB(255, 237, 232, 236)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: bookingHistory.length,
          itemBuilder: (context, index) {
            var booking = bookingHistory[index];
            bool isGroup = booking["items"].length > 1;

            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  ListTile(
                    leading: isGroup
                        ? const Icon(Icons.folder_special, color: Colors.deepPurple)
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              booking["items"][0]["image"],
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                    title: Text(booking["items"].length > 1 ? "Multiple Items" : booking["items"][0]["name"],
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("Purchased on: ${booking["date"]}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("\u{20B9}${booking["amount"]}",
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        if (isGroup)
                          IconButton(
                            icon: Icon(
                              booking["isExpanded"] ? Icons.expand_less : Icons.expand_more,
                              color: Colors.deepPurple,
                            ),
                            onPressed: () {
                              setState(() {
                                booking["isExpanded"] = !booking["isExpanded"];
                              });
                            },
                          ),
                      ],
                    ),
                  ),
                  if (booking["isExpanded"])
                    Column(
                      children: booking["items"].map<Widget>((item) {
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(item["image"], width: 50, height: 50, fit: BoxFit.cover),
                          ),
                          title: Text(item["name"]),
                          trailing: Text("\u{20B9}${item["price"]}",
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                        );
                      }).toList(),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
