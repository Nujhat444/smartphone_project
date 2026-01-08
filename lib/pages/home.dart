import 'package:flutter/material.dart';
import 'job_data.dart';
import 'job_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String search = "";

  @override
  Widget build(BuildContext context) {
    final jobs = jobList
        .where((j) =>
    j.title.toLowerCase().contains(search.toLowerCase()) ||
        j.location.toLowerCase().contains(search.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Dashboard"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search job or location",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (v) => setState(() => search = v),
            ),
          ),

          // 🔹 Top feature buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                featureButton(Icons.person, "Profile"),
                featureButton(Icons.bookmark, "Saved"),
                featureButton(Icons.info, "About"),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (context, i) {
                final job = jobs[i];
                return Card(
                  margin:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          job.title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text("${job.company} • ${job.location}"),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        JobDetailPage(job: job),
                                  ),
                                );
                              },
                              child: const Text("View Details"),
                            ),
                            Chip(
                              label: Text(
                                job.applied ? "Applied" : "Apply",
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor: job.applied
                                  ? Colors.green
                                  : Colors.indigo,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget featureButton(IconData icon, String text) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(text),
            content: Text("$text feature coming soon"),
          ),
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.indigo,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(text),
        ],
      ),
    );
  }
}
