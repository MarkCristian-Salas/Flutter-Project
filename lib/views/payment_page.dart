import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'notif_page.dart';
import 'home.dart';
import 'Post_Page.dart';
import 'job_page.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BalanceCard(),
              SizedBox(height: 20),
              // buttons ng balance card
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildColoredIconButton(context, Icons.send, 'Send'),
                  _buildColoredIconButton(context, Icons.download, 'Withdraw'),
                  _buildColoredIconButton(
                      context, Icons.attach_money, 'Deposit'),
                ],
              ),
              SizedBox(height: 20),
              SectionTitle(title: 'To Pay'),
              SizedBox(height: 10),
              JobCard(
                description: 'Job post details that need payment.',
              ),
              SizedBox(height: 20),
              SectionTitle(title: 'To Receive Payment'),
              SizedBox(height: 10),
              JobCard(
                description: 'Job post details awaiting payment.',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFE48F45),
        currentIndex: 3,
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JobPage()),
              );
              break;
            case 3:
              break;
          }
        },
      ),
    );
  }

  // Buttons ng balance card
  Widget _buildColoredIconButton(
      BuildContext context, IconData icon, String label) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE48F45),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(icon, size: 20, color: Colors.white),
            onPressed: () {
              // dagdagan ng page for this button
            },
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12),
        ),
      ],
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

class BalanceCard extends StatelessWidget {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current Balance:', style: TextStyle(fontSize: 18)),
            Text('₱ = 0.00',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Align(
              alignment: Alignment.centerRight,
            ),
          ],
        ),
      ),
    );
  }
}
