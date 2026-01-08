import 'package:flutter/material.dart';

class JobRecommendationPage extends StatelessWidget {
  const JobRecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Job Recommendations")),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.recommend),
            title: Text("Flutter Developer"),
            subtitle: Text("Based on your recent activity"),
          ),
          ListTile(
            leading: Icon(Icons.recommend),
            title: Text("Software Engineer"),
            subtitle: Text("Recommended for you"),
          ),
          ListTile(
            leading: Icon(Icons.recommend),
            title: Text("UI/UX Designer"),
            subtitle: Text("Jobs near your location"),
          ),
        ],
      ),
    );
  }
}
