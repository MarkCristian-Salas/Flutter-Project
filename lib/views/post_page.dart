import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  PostPageState createState() => PostPageState();
}

class PostPageState extends State<PostPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _rewardController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  XFile? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Post a New Job',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField(_locationController, 'Location'),
                const SizedBox(height: 16),
                _buildTextField(_professionController, 'Profession'),
                const SizedBox(height: 16),
                _buildTextField(_rewardController, 'Reward'),
                const SizedBox(height: 16),
                _buildTextField(
                  _descriptionController,
                  'Description',
                  maxLines: 5,
                ),
                const SizedBox(height: 16),
                _buildTextField(_contactController, 'Contact Number'),
                const SizedBox(height: 16),
                _buildTextField(_emailController, 'Email Address'),
                const SizedBox(height: 20),
                _buildAttachmentSection(),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Handle form submission
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Post Job',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }

  Widget _buildAttachmentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Attachments',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _image == null
            ? GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Tap to upload a photo',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              )
            : Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      File(_image!.path),
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: IconButton(
                      icon: const Icon(Icons.cancel, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          _image = null;
                        });
                      },
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
