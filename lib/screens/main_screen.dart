import 'package:flutter/material.dart';
import 'package:web_app_portfolio/screens/project_screen.dart';
import 'package:web_app_portfolio/utils/responsive_layout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app_portfolio/screens/home_screen.dart';
import 'package:web_app_portfolio/screens/about_screen.dart';
import 'package:web_app_portfolio/screens/contact_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  Widget _currentScreen = HomeScreen();

  void _navigateToScreen(Widget screen) {
    setState(() {
      _currentScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xFF40E0D0),
      appBar: AppBar(
         title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.red, Colors.purpleAccent],
          ).createShader(bounds),
        child: Text(
          "<RISHABH RANJAN />",
          style: GoogleFonts.lobster(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
         ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0, 
        actions: ResponsiveLayout.isDesktop(context)
            ? [
                _buildNavButton("Home", HomeScreen()),
                _buildNavButton("About", AboutScreen()),
                _buildNavButton("Contact", ContactScreen()),
                 _buildNavButton("Projects", ProjectsScreen()),
              ]
            : null, 
      ),
      drawer: ResponsiveLayout.isDesktop(context)
          ? null
          : Drawer(
             backgroundColor: Colors.blueGrey,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                       gradient: LinearGradient(
                        colors: [Colors.redAccent, Colors.purple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment : CrossAxisAlignment.center,
                      children: [
                        Text(
                          "<Importing Creativity...",
                          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                 _buildDrawerItem(
                    title: "Home",
                    icon: Icons.home,
                    onTap: () {
                      _navigateToScreen(HomeScreen());
                      Navigator.pop(context);
                    },
                  ),
                  _buildDrawerItem(
                    title: "About",
                    icon: Icons.info,
                    onTap: () {
                      _navigateToScreen(AboutScreen());
                      Navigator.pop(context);
                    },
                  ),
                  _buildDrawerItem(
                    title: "Contact",
                    icon: Icons.contact_mail,
                    onTap: () {
                      _navigateToScreen(ContactScreen());
                      Navigator.pop(context);
                    },
                  ),
                  _buildDrawerItem(
                    title: "Projects",
                    icon: Icons.work,
                    onTap: () {
                      _navigateToScreen(ProjectsScreen());
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500), 
        child: _currentScreen,
      ),
    );
  }

  Widget _buildNavButton(String title, Widget screen) {
    return TextButton(
      onPressed: () => _navigateToScreen(screen),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }

    Widget _buildDrawerItem({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.redAccent),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      hoverColor: Colors.red.withOpacity(0.1), 
      onTap: onTap,
    );
  }
}
