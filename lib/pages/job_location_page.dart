import 'package:flutter/material.dart';

class JobLocationPage extends StatelessWidget {
  final String location;
  const JobLocationPage({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Job Location")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on,
                size: 120, color: Colors.indigo),
            const SizedBox(height: 20),
            Text(location,
                style:
                const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text(
              "Map view will be integrated in future updates.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
