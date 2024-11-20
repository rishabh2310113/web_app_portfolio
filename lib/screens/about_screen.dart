import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Me",
          style: GoogleFonts.lobster(fontSize: 28, color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello! I'm Rishabh",
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "A passionate Flutter developer with a love for building beautiful, functional, and responsive mobile applications. I enjoy turning ideas into real-world applications and constantly improving my skills to stay ahead in the tech industry.",
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 32),
            Text(
              "Skills & Expertise",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _buildSkillChips([
                "Flutter",
                "Dart",
                "Firebase",
                "DSA",
                "REST APIs",
                "Version Control (Git)",
                "Responsive Design",
              ]),
            ),
            const SizedBox(height: 32),
            Text(
              "Personal Details",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.red),
              title: Text(
                "Location: Ghaziabad, India",
                style: GoogleFonts.poppins(color: Colors.white70),
              ),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.blue),
              title: Text(
                "Email: rishabh2310113@akgec.ac.in",
                style: GoogleFonts.poppins(color: Colors.white70),
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.green),
              title: Text(
                "Phone: +91 8340760441",
                style: GoogleFonts.poppins(color: Colors.white70),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              "Hobbies & Interests",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "When I'm not coding, you can find me exploring new technologies, playing video games, or hitting gym. I also enjoy reading tech blogs and contributing to open-source projects.",
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 32),

            Center(
              child: Text(
                "Thank you for visiting my portfolio!",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.white60,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey,
    );
  }

  List<Widget> _buildSkillChips(List<String> skills) {
    return skills
        .map(
          (skill) => Chip(
            label: Text(skill),
            backgroundColor: Colors.redAccent,
            labelStyle: GoogleFonts.poppins(color: Colors.white),
          ),
        )
        .toList();
  }
}


