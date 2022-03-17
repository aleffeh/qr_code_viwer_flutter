import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge by Frontend Mentor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Content(),
    );
  }
}

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd6e2f0),
      body: Column(
        children: const [
          Expanded(
            child: Center(child: Card()),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Attribution(),
          )
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    _vh(units) => (screenSize.height / 100) * units;
    _vw(units) => (screenSize.width / 100) * units;
    _vMin(double d) => _vh(d) > _vw(d) ? _vw(d) : _vh(d);

    return Container(
      height: _vh(65),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(129, 140, 166, 0.7),
              offset: Offset(0, 10),
              blurRadius: 30),
        ],
        color: Colors.white,
      ),
      child: SizedBox(
        width: _vh(42),
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: _vh(2), horizontal: _vh(2)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  "image-qr-code.png",
                  height: _vh(38),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_vh(1.2)),
              child: Text(
                "Improve your front-end skills by building projects",
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w700,
                  fontSize: (15 + _vh(1.2)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_vh(1.2)),
              child: Text(
                "Scan the QR code to visit Frontend Mentor and take your coding skills to the next level",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w400,
                  fontSize: 14 + _vMin(.8),
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Attribution extends StatelessWidget {
  const Attribution({Key? key}) : super(key: key);

  final bodyTextStyle = const TextStyle(
    color: Colors.black,
  );
  final linkTextStyle = const TextStyle(
    color: Colors.blue,
  );

  _openLink(link) async {
    if (await canLaunch(link)) {
      await launch(link);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: "Challenge by ", style: bodyTextStyle),
          TextSpan(
            text: "Frontend Mentor",
            style: linkTextStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                _openLink("https://www.frontendmentor.io/?ref=challenge");
              },
          ),
          TextSpan(text: ". Coded by ", style: bodyTextStyle),
          TextSpan(
            text: "Alef",
            style: linkTextStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                _openLink("https://github.com/aleffeh");
              },
          ),
          TextSpan(text: ".", style: bodyTextStyle)
        ],
      ),
    );
  }
}
