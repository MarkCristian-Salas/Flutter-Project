import 'package:flutter/material.dart';
import 'profile_page.dart'; // Import the profile page
import 'notif_page.dart';   // Import the notification page
import 'home.dart';         // Import the home page
import 'Post_Page.dart';    // Import the post page

class JobPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Jobs'),
        backgroundColor: Color(0xFFE48F45), // App bar color
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Navigate to NotificationPage when the notification icon is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Navigate to ProfilePage when the profile icon is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: 'Current Job'),
              SizedBox(height: 10),
              JobProgressBar(),
              SizedBox(height: 10),
              JobCard(description: 'Your current job in progress here.'), // Placeholder for current job content
              SizedBox(height: 20),
              SectionTitle(title: 'Pending Job/s'),
              SizedBox(height: 10),
              JobCard(description: 'Pending job details here.'), // Placeholder for pending jobs
              SizedBox(height: 20),
              SectionTitle(title: 'Job/s Posted'),
              SizedBox(height: 10),
              JobCard(description: 'Your posted job details here.'), // Placeholder for posted jobs
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFE48F45),
        currentIndex: 2, // Set current index to 'About Job'
        items: [
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
        selectedItemColor: Colors.black, // Bottom nav bar selected item color
        unselectedItemColor: Colors.white,
        onTap: (index) {
          if (index == 0) {
            // Navigate to HomePage when the Home tab is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 1) {
            // Navigate to PostPage when the Post tab is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PostPage()),
            );
          } // No action needed for index 2 as it's the current page
        },
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

class JobProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 5,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 14),
          ),
          child: Slider(
            value: 0.5, // Example progress value
            min: 0.0,
            max: 1.0,
            onChanged: (value) {},
          ),
        ),
        Row(
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

  JobCard({required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFFFFF4E6), // Light background color for job cards
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(description),
      ),
    );
  }
}
