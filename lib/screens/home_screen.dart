import 'package:flutter/material.dart';
import 'package:web_app_portfolio/utils/responsive_layout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ResponsiveLayout(
                  mobile: Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Center(
                      child: _responsiveImage(220, 220), 
                    ),
                  ),
                  tablet: SizedBox.shrink(), 
                  desktop: SizedBox.shrink(), 
                ),
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
                const SizedBox(height: 16),
                FadeInAnimation(
                  delay: 900,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, 
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
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
                            'https://www.instagram.com/invites/contact/?igsh=q6tstl4h6m60&utm_content=p3io3ir');
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

        Positioned(
          top: 30,
          right: 30,
          child: ResponsiveLayout(
            mobile: const SizedBox.shrink(), 
            tablet: _responsiveImage(300, 250), 
            desktop: _responsiveImage(700, 500),
          ),
        ),
      ],
    );
  }

  Widget _responsiveImage(double width, double height) {
    return Image.asset(
      'assets/Port1.png', 
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }

  Widget _buildSocialIcon(IconData icon, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(
        icon,
        color: Colors.white,
        size: 32,
      ),
      onPressed: onPressed,
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
