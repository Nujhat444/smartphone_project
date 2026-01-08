class Job {
  final String title;
  final String company;
  final String location;
  final String description;
  final String salary;
  final String deadline;
  bool applied;

  Job(
      this.title,
      this.company,
      this.location,
      this.description, {
        required this.salary,
        required this.deadline,
        this.applied = false,
      });
}

List<Job> jobList = [
  Job(
    "Software Engineer",
    "TechSoft Ltd",
    "Dhaka",
    "Develop and maintain mobile and web applications.",
    salary: "৳35,000 - ৳50,000",
    deadline: "15 Feb 2026",
  ),
  Job(
    "Flutter Developer",
    "Appify Solutions",
    "Dhaka",
    "Build cross-platform applications using Flutter.",
    salary: "৳40,000 - ৳60,000",
    deadline: "18 Feb 2026",
  ),
  Job(
    "UI/UX Designer",
    "Creative Studio",
    "Chattogram",
    "Design user-friendly and modern interfaces.",
    salary: "৳30,000 - ৳45,000",
    deadline: "20 Feb 2026",
  ),
  Job(
    "Backend Developer",
    "CodeBase IT",
    "Rajshahi",
    "Develop APIs and backend services.",
    salary: "৳45,000 - ৳65,000",
    deadline: "22 Feb 2026",
  ),
  Job(
    "Data Analyst",
    "Insight Corp",
    "Sylhet",
    "Analyze data and prepare reports.",
    salary: "৳38,000 - ৳55,000",
    deadline: "25 Feb 2026",
  ),
  Job(
    "Digital Marketer",
    "MarketPro",
    "Dhaka",
    "Manage SEO and digital marketing campaigns.",
    salary: "৳28,000 - ৳40,000",
    deadline: "27 Feb 2026",
  ),
  Job(
    "Project Manager",
    "NextGen Tech",
    "Dhaka",
    "Plan, execute and manage software projects.",
    salary: "৳50,000 - ৳70,000",
    deadline: "01 Mar 2026",
  ),
  Job(
    "QA Engineer",
    "SoftTest Ltd",
    "Khulna",
    "Test software and ensure quality.",
    salary: "৳32,000 - ৳45,000",
    deadline: "03 Mar 2026",
  ),
  Job(
    "System Administrator",
    "NetSecure",
    "Barishal",
    "Maintain servers and network systems.",
    salary: "৳40,000 - ৳55,000",
    deadline: "05 Mar 2026",
  ),
  Job(
    "IT Support Officer",
    "HelpDesk BD",
    "Rangpur",
    "Provide technical support to users.",
    salary: "৳25,000 - ৳35,000",
    deadline: "08 Mar 2026",
  ),
];
