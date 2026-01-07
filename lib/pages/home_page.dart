import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kings/utils/color.dart';
import 'package:kings/utils/nav_menu.dart';
import 'package:kings/widgets/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/router.dart';
import '/utils/extensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    bool _isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          )),
          child: Container(
              color: Colors.black.withOpacity(0.6),
              padding: EdgeInsets.symmetric(
                  horizontal: 40, vertical: _isMobile ? 15 : 40),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // menu
                    OpenContainer(
                        transitionDuration: const Duration(seconds: 1),
                        closedElevation: 0,
                        closedColor: Colors.transparent,
                        openColor: Colors.black,
                        transitionType: ContainerTransitionType.fade,
                        tappable: false,
                        closedBuilder: (context, action) {
                          return Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                                onTap: () {
                                  action();
                                },
                                child: Icon(Icons.menu,
                                    color: Colors.white,
                                    size: _isMobile ? 35 : 40)),
                          );
                        },
                        openBuilder: (context, action) {
                          return NavMenu(
                            action: action,
                            routeName: Routes.homePage,
                          );
                        }),
                    // name
                    Container(
                      margin:
                          EdgeInsets.only(top: 40, left: _isMobile ? 5 : 15),
                      alignment: Alignment.centerLeft,
                      child: SelectableText.rich(
                        TextSpan(
                          text: 'Stephen',
                          style: GoogleFonts.kurale(
                              fontSize: _isMobile ? 30 : 80,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(
                              text: ' Kings',
                              style: GoogleFonts.kurale(
                                  fontSize: _isMobile ? 30 : 80,
                                  color: yellowColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ).showCursorOnHover,
                    ),
                    // profession
                    Container(
                      color: Colors.black.withOpacity(0.2),
                      padding:
                          const EdgeInsets.only(top: 10, left: 15, bottom: 10),
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        '''
* Web and web app developer
* Cross-platform mobile app developer (Android, iOS)
* Cross-platform desktop app Developer (Windows, Linux, MacOS)
''',
                        fontSize: _isMobile ? 14 : 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // stacks
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      color: Colors.black.withOpacity(0.2),
                      padding:
                          const EdgeInsets.only(top: 10, left: 15, bottom: 10),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SelectableText('My Tech Stack:',
                                style: TextStyle(
                                  fontSize: _isMobile ? 18 : 24,
                                  color: yellowColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SelectableText(
                              'Flutter | Dart |',
                              style: TextStyle(
                                fontSize: _isMobile ? 18 : 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // social media
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // _imageIconButton('assets/facebook.png',
                          //     'https://web.facebook.com/SamuelKings.tech'),
                          // _imageIconButton('assets/twitter.png',
                          //     'https://twitter.com/apstkingssamuel'),
                          _imageIconButton('assets/linkedin.png',
                              'https://www.linkedin.com/in/kings-s-557b8516b'),
                          _imageIconButton('assets/github.png',
                              'https://github.com/Keshy99'),
                        ],
                      ),
                    )
                  ],
                ),
              ))),
    );
  }

  Widget _imageIconButton(String image, String url) {
    return InkWell(
      onTap: () async {
        if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
      },
      child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          child: Image.asset(
            image,
            height: 35,
            width: 35,
          ),
          margin: const EdgeInsets.only(right: 13)),
    ).showCursorOnHover.moveUpOnHover;
  }
}
