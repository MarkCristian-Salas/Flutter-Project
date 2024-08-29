import 'package:flutter/material.dart';
import 'profile_page.dart'; 
import 'notif_page.dart';
import 'home.dart';
import 'post_page.dart';
import 'payment_page.dart';

class JobPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Jobs'),
        backgroundColor: Color(0xFFE48F45), 
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
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
              JobCard(description: 'Your current job in progress here.'),
              SizedBox(height: 20),
              SectionTitle(title: 'Pending Job/s'),
              SizedBox(height: 10),
              JobCard(description: 'Pending job details here.'),
              SizedBox(height: 20),
              SectionTitle(title: 'Job/s Posted'),
              SizedBox(height: 10),
              JobCard(description: 'Your posted job details here.'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFE48F45),
        currentIndex: 2,
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
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostPage()),
              );
              break;
            case 2:
              
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentPage()),
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
            value: 0.5, // Progress Bar Vallue nya
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
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFFFF4E6),
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
          alignment: Alignment.center,
          child: Text(
            description,
            style: TextStyle(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
