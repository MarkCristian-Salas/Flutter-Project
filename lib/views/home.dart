import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE48F45), // App bar color
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification tap
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Handle profile tap
            },
          ),
        ],
      ),
      body: Container(
        color: Color(0xFFFDE49E), // Screen background color
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    icon: Icon(Icons.filter_list),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildWalletCard(),
                  _buildRecentJobCard(),
                  _buildJobPostCard(),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: _buildDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFE48F45), // Navigation bar color
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black87,
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
            icon: Icon(Icons.work),
            label: 'About Job',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Payment',
          ),
        ],
      ),
    );
  }

  Widget _buildWalletCard() {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(Icons.account_balance_wallet),
        title: Text('User Wallet'),
        subtitle: Text('\$1234.56'),
      ),
    );
  }

  Widget _buildRecentJobCard() {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(Icons.work),
        title: Text('Recent Job'),
        subtitle: Text('Software Developer at XYZ Corp'),
      ),
    );
  }

  Widget _buildJobPostCard() {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(Icons.category),
        title: Text('Job Post - Category Name'),
        trailing: IconButton(
          icon: Icon(Icons.filter_list),
          onPressed: () {
            // Handle category filter tap
          },
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFE48F45),
            ),
            child: Text(
              'Filters',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.filter_alt),
            title: Text('Filter 1'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.filter_alt),
            title: Text('Filter 2'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
