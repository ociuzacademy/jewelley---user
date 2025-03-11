import 'package:flutter/material.dart';
import 'package:jewellery_app/view/constants/urls.dart';
import 'package:jewellery_app/view/employee_module/emp_profile/service/emp_profile_service.dart';
import 'package:jewellery_app/view/employee_module/emp_profile/model/emp_profile_model.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 100, 4, 117),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<EmpProfileModel>(
        future: empProfileService(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/noResponse.jpg', height: 200),
                  const SizedBox(height: 10),
                  Text(
                    "Error: ${snapshot.error}",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("No user profile found"));
          }

          // Extract data
          final empProfile = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Image (Handle null photo safely)
                CircleAvatar(
                  radius: 50,
                  backgroundImage: empProfile.photo != null && empProfile.photo!.isNotEmpty
                      ? NetworkImage('${UserUrl.empbaseUrl}/${empProfile.photo!}')
                      : const AssetImage('assets/images/default_user.png') as ImageProvider,
                ),
                const SizedBox(height: 20),

                // Name
                Text(
                  empProfile.name ?? "No Name",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                // Email
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.email, color: Colors.purple),
                    title: Text(empProfile.email ?? "No Email"),
                  ),
                ),

                // Phone
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.phone, color: Colors.purple),
                    title: Text(empProfile.phone ?? "No Phone Number"),
                  ),
                ),

                // Address
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.location_on, color: Colors.purple),
                    title: Text(empProfile.address ?? "No Address"),
                  ),
                ),

                // Date Joined (Safe formatting)
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.calendar_today, color: Colors.purple),
                    title: Text(
                      empProfile.dateJoined != null
                          ? "${empProfile.dateJoined!.day}-${empProfile.dateJoined!.month}-${empProfile.dateJoined!.year}"
                          : "No Date of Joining",
                    ),
                  ),
                ),

                // Position
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.work, color: Colors.purple),
                    title: Text(empProfile.position ?? "No Position added"),
                  ),
                ),

                const SizedBox(height: 20), // Add spacing
              ],
            ),
          );
        },
      ),
    );
  }
}
