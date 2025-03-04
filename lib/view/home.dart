import 'package:flutter/material.dart';
import 'package:jewellery_app/view/booking_history.dart';
import 'package:jewellery_app/widgets/gold_page.dart';
import 'package:jewellery_app/view/trending_items.dart';

class HomeScreenScreen extends StatefulWidget {
  const HomeScreenScreen({super.key});

  @override
  _HomeScreenScreenState createState() => _HomeScreenScreenState();
}

class _HomeScreenScreenState extends State<HomeScreenScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static final List<Map<String, String>> trendingItems = [
    {"name": "Gold Necklace", "price": "\$250", "image": "assets/images/image1.jpg"},
    {"name": "Platinum Ring", "price": "\$450", "image": "assets/images/image1.jpg"},
    {"name": "Silver Bracelet", "price": "\$150", "image": "assets/images/image1.jpg"},
    {"name": "Diamond Earrings", "price": "\$600", "image": "assets/images/image1.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assigning key to Scaffold
      backgroundColor: Colors.white,
      drawer: openDrawer(context), // Attach Drawer
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section with Gradient Background
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black87, Color(0xFF4B374F)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Icons (Menu & Search)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: Icon(Icons.menu, color: Colors.white),
                      ),
                      Icon(Icons.search, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Greeting Text
                  Text("Hello, Hamza",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text("JewelGallery",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 20),
                  // Purchases Button
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookingHistoryScreen()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFDDEBEB),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Your Purchases", style: TextStyle(color: Colors.black)),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Categories Section
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GoldJewelryPage()),
                      );
                    },
                    child: _buildCategoryIcon(Icons.diamond, "Gold"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookingHistoryScreen()),
                      );
                    },
                    child: _buildCategoryIcon(Icons.diamond, "Platinum"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookingHistoryScreen()),
                      );
                    },
                    child: _buildCategoryIcon(Icons.diamond, "Silver"),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Trending Items Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Trending Items",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            TrendingItems()
          ],
        ),
      ),
    );
  }

  // Widget for Category Icons
  Widget _buildCategoryIcon(IconData icon, String title) {
    return Column(
      children: [
        //SizedBox(width: 6,),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.brown.shade100,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, size: 30, color: Colors.brown.shade700),
        ),
        SizedBox(height: 5),
        Text(title, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  // Drawer Widget
  Widget openDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueGrey),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(Icons.person, size: 40, color: Colors.blueGrey),
                ),
                SizedBox(height: 10),
                Text("Hello, Hamza", style: TextStyle(color: Colors.white, fontSize: 18)),
                Text("hamza@example.com", style: TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.blueGrey),
            title: Text("Home"),
            onTap: () => Navigator.pop(context), // Close Drawer
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart, color: Colors.blueGrey),
            title: Text("My Purchases"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.favorite, color: Colors.blueGrey),
            title: Text("Wishlist"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blueGrey),
            title: Text("Settings"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.redAccent),
            title: Text("Logout"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
