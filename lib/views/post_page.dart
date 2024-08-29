import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
        backgroundColor: Color(0xFFE48F45),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField('Location'),
              SizedBox(height: 20),
              _buildTextField('Profession'),
              SizedBox(height: 20),
              _buildTextField('Reward'),
              SizedBox(height: 20),
              _buildTextField('Description', maxLines: 5),
              SizedBox(height: 20),
              _buildAttachmentSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFE48F45),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.attach_file, color: Colors.white),
              onPressed: () {
              },
            ),
            TextButton(
              onPressed: () {
              },
              child: Text(
                'Post',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Color(0xFFFFF4E6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildAttachmentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Attachments',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xFFFFF4E6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text('No attachments yet'),
          ),
        ),
      ],
    );
  }
}
