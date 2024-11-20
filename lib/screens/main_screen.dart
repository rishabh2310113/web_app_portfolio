import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text(
          "<RISHABH RANJAN />",
          style: GoogleFonts.lobster(
            fontSize: 28,
            color: Colors.white,
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
                 _buildNavButton("Projects", ContactScreen()),
              ]
            : null, 
      ),
      drawer: ResponsiveLayout.isDesktop(context)
          ? null
          : Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color:  Colors.red,
                    ),
                    child: Text(
                      'Navigation',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () {
                      _navigateToScreen(HomeScreen());
                      Navigator.pop(context); 
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About'),
                    onTap: () {
                      _navigateToScreen(AboutScreen());
                      Navigator.pop(context); 
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.contact_mail),
                    title: Text('Contact'),
                    onTap: () {
                      _navigateToScreen(ContactScreen());
                      Navigator.pop(context); 
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.contact_mail),
                    title: Text('Projects'),
                    onTap: () {
                      _navigateToScreen(ContactScreen());
                      Navigator.pop(context); 
                    },
                  ),
                ],
              ),
            ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 500), 
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
}

