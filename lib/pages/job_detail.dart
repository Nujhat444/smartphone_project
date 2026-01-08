import 'package:flutter/material.dart';
import 'job_data.dart';
import 'company_details_page.dart';
import 'job_location_page.dart';
import 'cv_upload_page.dart';

class JobDetailPage extends StatefulWidget {
  final Job job;
  const JobDetailPage({super.key, required this.job});

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.job.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.job.company,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(widget.job.location),
            const SizedBox(height: 16),

            Text(widget.job.description),
            const SizedBox(height: 16),

            // 🔹 Row for Salary & Deadline buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("Monthly Salary"),
                        content: Text(widget.job.salary),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text("View Salary"),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("Application Deadline"),
                        content: Text(widget.job.deadline),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text("View Deadline"),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // 🔹 Company / Location / CV buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        CompanyDetailsPage(company: widget.job.company),
                  ),
                );
              },
              child: const Text("Company Details"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        JobLocationPage(location: widget.job.location),
                  ),
                );
              },
              child: const Text("View Job Location"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CVUploadPage()),
                );
              },
              child: const Text("Upload CV"),
            ),

            const Spacer(),

            // 🔹 Apply button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: widget.job.applied
                    ? null
                    : () {
                  setState(() {
                    widget.job.applied = true;
                  });
                },
                child: Text(
                  widget.job.applied ? "Already Applied" : "Apply Now",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
