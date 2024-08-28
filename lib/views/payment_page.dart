import 'package:flutter/material.dart';
import 'profile_page.dart'; // Import the profile page
import 'notif_page.dart'; // Import the notification page
import 'home.dart'; // Import the home page
import 'Post_Page.dart'; // Import the Post page
import 'job_page.dart'; // Import the Job page

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BalanceCard(), // Current balance section, reusing the BalanceCard widget from home.dart
              SizedBox(height: 20),
              SectionTitle(title: 'To Pay'),
              SizedBox(height: 10),
              JobCard(
                  description:
                      'Job post details that need payment.'), // Placeholder for job posts to pay
              SizedBox(height: 20),
              SectionTitle(title: 'To Receive Payment'),
              SizedBox(height: 10),
              JobCard(
                  description:
                      'Job post details awaiting payment.'), // Placeholder for job posts to receive payment
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFE48F45),
        currentIndex: 3, // Set the current index to 'Payment'
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
          switch (index) {
            case 0:
              // Navigate to HomePage when the Home tab is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            case 1:
              // Navigate to PostPage when the Post tab is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostPage()),
              );
              break;
            case 2:
              // Navigate to JobPage when the About Job tab is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JobPage()),
              );
              break;
            case 3:
              // Currently on PaymentPage, no navigation needed
              break;
          }
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

class JobCard extends StatelessWidget {
  final String description;

  JobCard({required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // Consistent height for job cards
      width: double.infinity, // Take full width of the parent
      decoration: BoxDecoration(
        color: Color(0xFFFFF4E6), // Light background color for job cards
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.center, // Align text to the center
          child: Text(
            description,
            style: TextStyle(fontSize: 16),
            overflow: TextOverflow.ellipsis, // Handle overflow if needed
          ),
        ),
      ),
    );
  }
}
