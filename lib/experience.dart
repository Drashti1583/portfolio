import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Experience extends StatelessWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.shortestSide > 600;
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = isWeb ? screenWidth * 0.45 : screenWidth * 0.9;

    Widget projetCard(String lang, String title, String description, String certificateUrl) {
      return Container(
        width: cardWidth,
        margin: EdgeInsets.all(10.0),
        child: Card(
          color: Color(0xff262628),
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(height: 3.0),
                Text(
                  description,
                  style: TextStyle(color: Colors.white70, fontSize: 16.0),
                ),
                SizedBox(height: 10.0), // Added space before icon and text
                Row(
                  children: [
                    Expanded(child: Container()),
                    IconButton(
                      onPressed: () {
                        launch(certificateUrl); // Launch URL here
                      },
                      icon: Icon(
                        FontAwesomeIcons.certificate,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Certificate',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff252525),
        title: Text(
          'Experience',
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
                'INTERNSAVY',
                'Android App Development',
                'Implemented basic Android app concepts effectively. Cleared fundamental Android development principles. Demonstrated practical application through functional app creation.',
                'https://drive.google.com/file/d/1CGEEvp4jm6YgRyx4iAt_T5V9hLesCgoT/view?usp=sharing',
              ),
              SizedBox(height: 20),
              projetCard(
                'BRAINY BEAM TECHNOLOGY',
                'Android Developer',
                'Formulated UI layouts using XML. Implemented Logic in Java. Executed SQL queries for data management task.',
                'https://drive.google.com/file/d/1i9tiIihbTNxBifbtR6ZJ9IiEbvDJBuaB/view?usp=sharing',
              ),
              SizedBox(height: 20),
              projetCard(
                'AVIZ HEALTHCARE',
                'Flutter Developer',
                'Designed app layouts with a drag-and-drop interface. Accessed pre-built UI components for efficiency. Seamlessly integrated APIs and databases.',
                'https://drive.google.com/file/d/1qqtn3NBGjxBkjUIxyz-KvNgWTwQ-gCXH/view?usp=sharing',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
