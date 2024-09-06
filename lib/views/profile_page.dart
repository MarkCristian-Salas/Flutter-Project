import 'package:flutter/material.dart';
import 'package:login/views/post_job_detail.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ProfileHeader(),
            const SizedBox(height: 30),
            _buildSection(
              context,
              'Bio',
              const BioCard(),
              onEdit: () {
                _showEditDialog(
                    context, 'Edit Bio', 'Bio', 'Muli ay iyong pagbigyan...');
              },
            ),
            const SizedBox(height: 30),
            _buildSection(
              context,
              'Completed Jobs',
              const JobCard(),
              seeAll: () {
                // Navigate to see all completed jobs
              },
            ),
            const SizedBox(height: 30),
            _buildSection(
              context,
              'Posted Jobs',
              const JobCard(),
              seeAll: () {
                // Navigate to see all posted jobs
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, Widget content,
      {VoidCallback? onEdit, VoidCallback? seeAll}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Row(
              children: [
                if (onEdit != null)
                  IconButton(
                    icon: const Icon(Icons.edit,
                        size: 20, color: Colors.blueAccent),
                    onPressed: onEdit,
                  ),
                if (seeAll != null)
                  TextButton(
                    onPressed: seeAll,
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        content,
      ],
    );
  }

  void _showEditDialog(
      BuildContext context, String title, String field, String initialValue) {
    final TextEditingController controller =
        TextEditingController(text: initialValue);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: field),
            maxLines: null,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle save action
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            // Profile image
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profile.png'),
              backgroundColor: Colors.lightBlue,
              child: Icon(Icons.person, color: Colors.white, size: 60),
            ),
            // Profile icon
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.lightBlue,
                ),
                child: IconButton(
                  icon: const Icon(Icons.camera_alt, color: Colors.white),
                  onPressed: () {
                    // Add action here
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'Marvin John D. Macam',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        const ProfileInfoCard(),
      ],
    );
  }
}

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileInfoRow(label: 'Location:', value: ''),
          ProfileInfoRow(label: 'Contact:', value: ''),
          ProfileInfoRow(label: 'Profession', value: ''),
        ],
      ),
    );
  }
}

// Rest of the code remains the same for BioCard, ProfileInfoRow, and JobCard

class ProfileInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, size: 20, color: Colors.blueAccent),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onEdit;

  const SectionTitle({super.key, required this.title, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.edit, size: 20, color: Colors.blueAccent),
          onPressed: onEdit,
        ),
      ],
    );
  }
}

class BioCard extends StatelessWidget {
  const BioCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        'Muli ay iyong pagbigyan,\nako\'y nagkamali\nMuli ay iyong patawarin, ako\'y nagsisi\nAlam kong ako\'y nangakong\n\'di na mauulit pa\nAko\'y nagkamali sa\'yo, muli ay patawarin mo',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black87,
          height: 1.5,
        ),
      ),
    );
  }
}

class SectionWithSeeAll extends StatelessWidget {
  final String title;

  const SectionWithSeeAll({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'See All',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blueAccent,
            ),
          ),
        ),
      ],
    );
  }
}

class JobCard extends StatelessWidget {
  const JobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const PostJobDetail(
                    jobTitle: '',
                    jobDescription: '',
                  )),
        );
      },
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            'Job Details Here',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
