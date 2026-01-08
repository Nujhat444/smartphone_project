import 'package:flutter/material.dart';
import 'package:smartphone_project/auth/auth_service.dart';
import 'package:smartphone_project/pages/login_page.dart';
import 'package:smartphone_project/pages/signup_page.dart';
class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final email = _authService.getCurrentUserEmail();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Profile Avatar
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.indigo,
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 16),

            // User Email
            Text(
              email ?? "No Email Found",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 30),

            // Profile Options
            Card(
              child: ListTile(
                leading: const Icon(Icons.email),
                title: const Text("Email"),
                subtitle: Text(email ?? ""),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.work),
                title: const Text("Applied Jobs"),
                subtitle: const Text("Coming Soon"),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                subtitle: const Text("Coming Soon"),
              ),
            ),

            const Spacer(),

            // Logout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () async {
                  await _authService.signOut();

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const SignIn()),
                        (route) => false,
                  );
                },
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
