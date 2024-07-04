import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:portfolio/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:flutter/services.dart' show ByteData, rootBundle;

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  Future<void> _openPDF(BuildContext context) async {
    try {
      // Get the temporary directory of the app
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;

      // Copy the PDF file from the assets to the temporary directory
      String assetPath = 'lib/assets/Resume.pdf'; // Replace with your actual path
      String pdfPath = '$tempPath/Resume.pdf';
      ByteData data = await rootBundle.load(assetPath);
      List<int> bytes = data.buffer.asUint8List();
      File pdfFile = File(pdfPath);
      await pdfFile.writeAsBytes(bytes);

      // Navigate to the PDF viewer
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PDFViewer(path: pdfPath),
        ),
      );
    } catch (e) {
      print('Error opening PDF: $e');
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWeb = kIsWeb;
    final screenWidth = MediaQuery.of(context).size.width;
    final imageSize = isWeb ? screenWidth * 0.4 : 200.0;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  child: Image.asset('lib/assets/images/image.jpg'),
                  height: 400,
                  width: 400,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Hello I am',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Text(
                'DRASHTI UNADKAT',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                'Software Developer',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  _launchURL('https://drive.google.com/file/d/1nJzFhAlZnYccjRhDYBAVDOObL5KW5eou/view?usp=sharing');
                },
                child: Text("Resume"),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      _launchURL('https://github.com/Drashti1583');
                    },
                    icon: Icon(FontAwesomeIcons.github, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      _launchURL('https://www.linkedin.com/in/drashti-unadkat');
                    },
                    icon: Icon(FontAwesomeIcons.linkedin, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      _launchURL('mailto:your.drashtiunadkat30@gmail.com');
                    },
                    icon: Icon(FontAwesomeIcons.google, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
