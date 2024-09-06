import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'notif_page.dart';
import 'home.dart';
import 'Post_Page.dart';
import 'job_page.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                expandedHeight: 200.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: const SizedBox.shrink(),
                  background: Container(
                    color: const Color.fromARGB(255, 3, 169, 244),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              BalanceCard(),
                              SizedBox(width: 5),
                              YourEarnsCard(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  const Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left:
                                30.0), // Add space between Payment text and the right edge
                        child: Text(
                          'Payment',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationPage(),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.person, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionTitle(title: 'Actions'),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildColoredIconButton(context, Icons.send, 'Send'),
                          _buildColoredIconButton(
                              context, Icons.download, 'Withdraw'),
                          _buildColoredIconButton(
                              context, Icons.attach_money, 'Deposit'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const SectionTitle(title: 'To Pay'),
                      const SizedBox(height: 10),
                      const JobCard(
                          description: 'Job post details that need payment.'),
                      const SizedBox(height: 20),
                      const SectionTitle(title: 'To Receive Payment'),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: JobCard(
                          description: 'Job post details awaiting payment.'),
                    );
                  },
                  childCount: 10,
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        currentIndex: 3,
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const JobPage()),
              );
              break;
            case 3:
              break;
          }
        },
      ),
    );
  }
}

Widget _buildColoredIconButton(
    BuildContext context, IconData icon, String label) {
  return Column(
    children: [
      Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 3, 169, 244),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(icon, size: 20, color: Colors.white),
          onPressed: () {
            // Add navigation or action for this button
          },
        ),
      ),
      const SizedBox(height: 4),
      Text(
        label,
        style: const TextStyle(fontSize: 12),
      ),
    ],
  );
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

class JobCard extends StatelessWidget {
  final String description;

  const JobCard({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width * 0.47, // Responsive width
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Opacity(
            opacity: 0.3,
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    'Current Balance:',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    overflow: TextOverflow.ellipsis, // Prevents overflow
                  ),
                ),
                SizedBox(height: 4), // Add space between the texts
                Flexible(
                  child: Text(
                    '₱ 23,587',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    overflow: TextOverflow.ellipsis, // Prevents overflow
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class YourEarnsCard extends StatelessWidget {
  const YourEarnsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width * 0.44, // Responsive width
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Opacity(
            opacity: 0.3,
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    'Your Earnings:',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    overflow: TextOverflow.ellipsis, // Prevents overflow
                  ),
                ),
                SizedBox(height: 4), // Space between texts
                Flexible(
                  child: Text(
                    '₱ 12,345',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    overflow: TextOverflow.ellipsis, // Prevents overflow
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
