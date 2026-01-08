import 'package:flutter/material.dart';

class CVUploadPage extends StatelessWidget {
  const CVUploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Upload CV")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.upload_file, size: 90),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Choose CV File"),
            ),
            const SizedBox(height: 10),
            const Text("No file selected"),
          ],
        ),
      ),
    );
  }
}
