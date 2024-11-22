import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.red, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
        child: Text(
          "About Me",
          style: GoogleFonts.lobster(fontSize: 28, color: Colors.white),
        ),
          ),
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInAnimation(
              delay: 200,
            child: Text(
              "Hello! I'm Rishabh",
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            ),
            const SizedBox(height: 16),
             FadeInAnimation(
              delay: 400,
            child: Text(
              "A passionate Flutter developer with a love for building beautiful, functional, and responsive mobile applications. I enjoy turning ideas into real-world applications and constantly improving my skills to stay ahead in the tech industry.",
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.white70),
            ),
             ),
            const SizedBox(height: 32),
            FadeInAnimation(
              delay: 600,
           child: Text(
              "Skills & Expertise",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
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
             FadeInAnimation(
              delay: 800,
            child:Text(
              "Personal Details",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
             ),
            const SizedBox(height: 16),
                _buildInfoTile(Icons.location_on, Colors.red,
                "Location: Ghaziabad, India"),
            _buildInfoTile(Icons.email, Colors.blue,
                "Email: rishabh2310113@akgec.ac.in"),
            _buildInfoTile(Icons.phone, Colors.green,
                "Phone: +91 8340760441"),
            const SizedBox(height: 32),
              FadeInAnimation(
              delay: 1000,
            child :Text(
              "Hobbies & Interests",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
              ),
            const SizedBox(height: 16),
            Text(
              "When I'm not coding, you can find me exploring new technologies, playing video games, or hitting gym. I also enjoy reading tech blogs and contributing to open-source projects.",
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 32),

            Center(
               child: FadeInAnimation(
                delay: 1200,
              child: Text(
                "Thank you for visiting my portfolio!",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.white60,
                ),
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
          (skill) => Chip(  // lambda function
            label: Text(skill),
               backgroundColor: Colors.purpleAccent.withOpacity(0.7),
            labelStyle: GoogleFonts.poppins(color: Colors.white),
            shadowColor: Colors.redAccent,
            elevation: 4,
          ),
        )
        .toList();
  }

  Widget _buildInfoTile(IconData icon, Color color, String text) {
    return FadeInAnimation(
      delay: 800,
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(
          text,
          style: GoogleFonts.poppins(color: Colors.white70),
        ),
      ),
    );
  }
}

class FadeInAnimation extends StatelessWidget {
  final Widget child;
  final int delay;

  const FadeInAnimation({required this.child, required this.delay});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 1000),
      tween: Tween<double>(begin: 0.0, end: 1.0),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value as double,
          child: Transform.translate(
            offset: Offset(0.0, 50 * (1 - (value as double))),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
