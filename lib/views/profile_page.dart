import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFFE48F45),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(),
            SizedBox(height: 20),
            SectionTitle(
                title: 'Bio',
                onEdit: () {
                  _showEditDialog(
                      context, 'Edit Bio', 'Bio', 'Muli ay iyong pagbigyan...');
                }),
            SizedBox(height: 10),
            BioCard(),
            SizedBox(height: 20),
            SectionWithSeeAll(title: 'Completed Jobs'),
            SizedBox(height: 10),
            JobCard(),
            SizedBox(height: 20),
            SectionWithSeeAll(title: 'Posted Job'),
            SizedBox(height: 10),
            JobCard(),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(
      BuildContext context, String title, String field, String initialValue) {
    final TextEditingController _controller =
        TextEditingController(text: initialValue);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: field),
            maxLines: null,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle save action
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(
              'assets/images/profile.png'), // Placeholder for profile image
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Marvin John D. Macam',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ProfileInfoCard(),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xFFFFF4E6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileInfoRow(label: 'Location', value: 'Mangaldan'),
          ProfileInfoRow(
              label: 'Contact Information',
              value:
                  'Email: marvin@gmail.com\nNumber: 09123456789\nFB: facebook.com/marvin'),
          ProfileInfoRow(label: 'Profession', value: 'Electrician'),
        ],
      ),
    );
  }
}

class ProfileInfoRow extends StatelessWidget {
  final String label;
  final String value;

  ProfileInfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.right,
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit, size: 16),
            onPressed: () {
              // Implement edit function
            },
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onEdit;

  SectionTitle({required this.title, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: Icon(Icons.edit, size: 16),
          onPressed: onEdit,
        ),
      ],
    );
  }
}

class BioCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFFFFF4E6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'Muli ay iyong pagbigyan,\nako\'y nagkamali\nMuli ay iyong patawarin, ako\'y nagsisi\nAlam kong ako\'y nangakong\n\'di na mauulit pa\nAko\'y nagkamali sa\'yo, muli ay patawarin mo',
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}

class SectionWithSeeAll extends StatelessWidget {
  final String title;

  SectionWithSeeAll({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {},
          child: Text('See All', style: TextStyle(fontSize: 14)),
        ),
      ],
    );
  }
}

class JobCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFFFFF4E6), // Light background color for job cards
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text('Job Details Here'),
      ),
    );
  }
}
