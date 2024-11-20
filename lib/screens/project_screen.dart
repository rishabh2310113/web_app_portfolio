import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Projects",
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
              "Here are some of my projects:",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            _buildProjectCard(
              context,
              title: "E-Commerce App",
              description:
                  "A feature-rich e-commerce app with product listings, shopping cart, and checkout functionality.",
              githubLink: "https://github.com/rishabh2310113/e_commerce",
            ),
            const SizedBox(height: 16),
            _buildProjectCard(
              context,
              title: "To-Do App",
              description:
                  "A simple and efficient to-do app for managing tasks and improving productivity.",
              githubLink: "https://github.com/rishabh2310113/to_do_application",
            ),
            const SizedBox(height: 16),
            _buildProjectCard(
              context,
              title: "Quiz App",
              description:
                  "An interactive quiz app with multiple categories, leaderboards, and scoring features.",
              githubLink: "https://github.com/rishabh2310113/quiz_app",
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey,
    );
  }

  Widget _buildProjectCard(BuildContext context,
      {required String title,
      required String description,
      required String githubLink}) {
    return Card(
      color: Color(0xFF02042A),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton.icon(
                onPressed: () async {
                  final Uri url = Uri.parse(githubLink);
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                ),
                icon: Icon(FontAwesomeIcons.github, color: Colors.white),
                label: Text(
                  "View on GitHub",
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}