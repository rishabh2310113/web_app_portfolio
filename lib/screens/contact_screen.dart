 import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact Me",
          style: GoogleFonts.lobster(fontSize: 28, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Get in Touch",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Feel free to reach out to me using the form below or through my social media links.",
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 32),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Your Name",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "Your Email",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      labelText: "Your Message",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a message";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Message sent successfully!")),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: Text(
                      "Send Message",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Text(
              "Connect with Me",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialIcon(FontAwesomeIcons.instagram, () async {
                  final Uri url = Uri.parse(
                      'https://www.instagram.com/invites/contact/?igshid=q6tstl4h6m60');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                }),
                const SizedBox(width: 16),
                _buildSocialIcon(FontAwesomeIcons.twitter, () async {
                  final Uri url = Uri.parse('https://twitter.com/Rishabh2310113');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                }),
                const SizedBox(width: 16),
                _buildSocialIcon(FontAwesomeIcons.linkedin, () async {
                  final Uri url =
                      Uri.parse('https://www.linkedin.com/in/rishabh-ranjan18/');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                }),
                const SizedBox(width: 16),
                _buildSocialIcon(FontAwesomeIcons.github, () async {
                  final Uri url = Uri.parse('https://github.com/rishabh2310113');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                }),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

  Widget _buildSocialIcon(IconData icon, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(
        icon,
        color: Colors.white70,
        size: 32,
      ),
      onPressed: onPressed,
    );
  }


