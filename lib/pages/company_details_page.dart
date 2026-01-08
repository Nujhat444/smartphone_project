import 'package:flutter/material.dart';

class CompanyDetailsPage extends StatelessWidget {
  final String company;
  const CompanyDetailsPage({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Company Details")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(company,
                style:
                const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("Industry: Information Technology"),
            const Text("Company Size: 50-100 Employees"),
            const SizedBox(height: 10),
            const Text(
              "This company is focused on delivering high quality software "
                  "solutions and providing innovative digital services.",
            ),
          ],
        ),
      ),
    );
  }
}
