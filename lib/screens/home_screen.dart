import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
           Positioned.fill(
            child: AnimatedBackground(),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   BounceInAnimation(
                    delay: 200,
                    child: const CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/Port1.png'),
                    ),
                  ),
                   const SizedBox(height: 24),
                  FadeInAnimation(
                    delay: 300,
                    child: Text(
                      "Hi there, Welcome to My Space 👋",
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  FadeInAnimation(
                    delay: 600,
                    child: Text(
                      "I'm Rishabh, A Flutter Developer",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 24),
                  FadeInAnimation(
                    delay: 900,
                    child: ElevatedButton.icon(
                            onPressed: () async {
                            try {
                              final data = await rootBundle.load('assets/resume.pdf');
                              final bytes = data.buffer.asUint8List();
                              final dir = await getTemporaryDirectory();
                              final file = File('${dir.path}/resume.pdf');
                              await file.writeAsBytes(bytes);
                              OpenFile.open(file.path);
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Error loading file: $e'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                          },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, 
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                         shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 10,
                        shadowColor: Colors.redAccent,
                      ),
                      icon: Icon(FontAwesomeIcons.download, color: Colors.white),
                      label: Text(
                        "Download CV",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  FadeInAnimation(
                    delay: 1200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialIcon(FontAwesomeIcons.instagram, () async {
                          final Uri url = Uri.parse(
                              'https://www.instagram.com/im_deadmen/');
                          if (!await launchUrl(url)) {
                            throw Exception('Could not load $url');
                          }
                        }),
                        const SizedBox(width: 16),
                        _buildSocialIcon(FontAwesomeIcons.twitter, () async {
                          final Uri url =
                              Uri.parse('https://x.com/Rishabh2310113');
                          if (!await launchUrl(url)) {
                            throw Exception('Could not load $url');
                          }
                        }),
                        const SizedBox(width: 16),
                        _buildSocialIcon(FontAwesomeIcons.linkedin, () async {
                          final Uri url = Uri.parse(
                              'https://www.linkedin.com/in/rishabh-ranjan18/');
                          if (!await launchUrl(url)) {
                            throw Exception('Could not load $url');
                          }
                        }),
                        const SizedBox(width: 16),
                        _buildSocialIcon(FontAwesomeIcons.github, () async {
                          final Uri url =
                              Uri.parse('https://github.com/rishabh2310113');
                          if (!await launchUrl(url)) {
                            throw Exception('Could not load $url');
                          }
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedScale(
          scale: 1.0,
          duration: Duration(milliseconds: 300),
          child: CircleAvatar(
            backgroundColor: Colors.white12,
            radius: 28,
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 10),
      curve: Curves.easeInOut,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [Colors.black, Colors.red, Colors.purple],
          stops: [0.1, 0.5, 1.0],
          center: Alignment.topLeft,
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

class BounceInAnimation extends StatelessWidget {
  final Widget child;
  final int delay;

  const BounceInAnimation({required this.child, required this.delay});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 1500),
      tween: Tween<double>(begin: 0.8, end: 1.0),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value as double,
          child: child,
        );
      },
      child: child,
    );
  }
}
