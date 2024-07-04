import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProject extends StatefulWidget {
  const MyProject({Key? key}) : super(key: key);

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  Widget projetCard(String lang, String title, String description, String githubLink) {
    final isWeb = kIsWeb;
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = isWeb ? screenWidth * 0.45 : screenWidth * 0.9;

    return Container(
      width: cardWidth,
      margin: EdgeInsets.all(10.0),
      child: Card(
        color: Color(0xff262628),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Ensure minimum vertical space
            children: [
              Text(
                lang,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10.0),
              SizedBox(
                height: 70.0, // Adjust height based on your content
                child: SingleChildScrollView(
                  child: Text(
                    description,
                    style: TextStyle(color: Colors.white70, fontSize: 16.0),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      _launchURL(githubLink);
                    },
                    icon: Icon(
                      FontAwesomeIcons.github,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWeb = kIsWeb;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff252525),
        title: Text(
          'Projects',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white), // Set icon color here
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              projetCard(
                'FLUTTER',
                'Catalog App',
                'A catalog app in Flutter allows users to browse items, view details, and add them to a cart or wishlist, offering a smooth and interactive user experience.',
                'https://github.com/Drashti1583/catalog-app',
              ),
              projetCard(
                'JAVA',
                'Employee Payroll System',
                'A payroll system in Java automates salary calculations, tax deductions, and pay slip generation, streamlining employee payment processes.',
                'https://github.com/Drashti1583/PayrollSystem',
              ),
              projetCard(
                'FLUTTER',
                'Grocery Inventory',
                'A grocery inventory app in Flutter with Firebase integration allows users to manage grocery items efficiently, with real-time data sync for adding, updating, and deleting items.',
                'https://github.com/Drashti1583/groceryinventory',
              ),
              projetCard(
                'HTML/CSS/JS',
                'Tic-Tac-Toe',
                'Play this HTML/CSS/JavaScript Tic Tac Toe game where two players mark cells in a 3x3 grid, detect wins, and start new games for a seamless gaming experience.',
                'https://github.com/Drashti1583/TicToeGame',
              ),
              projetCard(
                'ANDROID',
                'Blood Donate',
                'Build an Android blood donation app with SQLite for secure donor registration and efficient donation requests, ensuring streamlined blood donation management.',
                'https://github.com/Drashti1583/BloodDonate',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
