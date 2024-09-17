import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'notif_page.dart';
import 'home.dart';
import 'post_page.dart';
import 'payment_page.dart';
import 'current_job_detail.dart'; // Import the JobDetailPage for current jobs
import 'pending_job_detail.dart'; // Import the PendingJobDetailPage

class JobPage extends StatelessWidget {
  const JobPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            SizedBox(width: 16),
            Text(
              'About Job',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 3, 169, 244),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: 'Current Job'),
              const SizedBox(height: 10),
              const JobProgressBar(),
              const SizedBox(height: 10),
              JobCard(
                description: 'Your current job in progress here.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const CurrentJobDetailPage(), // Navigate to CurrentJobDetailPage
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const SectionTitle(title: 'Pending Job/s'),
              const SizedBox(height: 10),
              JobCard(
                description: 'Pending job details here.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PendingJobDetailPage(
                        jobTitle: 'Your Job Title',
                        jobDescription: 'Your Job Description',
                      ), // Navigate to PendingJobDetailPage
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const SectionTitle(title: 'Job/s Posted'),
              const SizedBox(height: 10),
              const JobCard(description: 'Your posted job details here.'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About Job',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Payment',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.lightBlue,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PostPage()),
              );
              break;
            case 2:
              break; // Stay on JobPage
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaymentPage()),
              );
              break;
          }
        },
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

class JobProgressBar extends StatelessWidget {
  const JobProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 5,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
          ),
          child: Slider(
            value: 0.5, // Progress Bar Value
            min: 0.0,
            max: 1.0,
            onChanged: (value) {},
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Start'),
            Text('In Progress'),
            Text('Completed'),
          ],
        ),
      ],
    );
  }
}

class JobCard extends StatelessWidget {
  final String description;
  final VoidCallback? onTap;

  const JobCard({super.key, required this.description, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          onTap, // GestureDetector will detect taps and trigger the onTap function.
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              description,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
