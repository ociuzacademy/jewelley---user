import 'package:flutter/material.dart';
import 'package:jewellery_app/view/home.dart';
import 'package:jewellery_app/view/user_feedback.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: const Color.fromARGB(255, 100, 4, 117),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/profile.jpg"),
            ),
            SizedBox(height: 20),
            Text(
              "John Doe",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: Icon(Icons.email, color: Colors.purple),
                title: Text("johndoe@example.com"),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.phone, color: Colors.purple),
                title: Text("+91 9876543210"),
              ),
            ),


///////////////////////////////////////////////////
             TextButton(
                                  onPressed: () {
                                    
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                             FeedbackScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 93, 7, 87),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),


                                TextButton(
                                  onPressed: () {
                                    
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                             HomeScreenScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 93, 7, 87),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
////////////////////////////////////////////////////

          ],
        ),
        
      ),
    );
  }
}
