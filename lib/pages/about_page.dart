import 'package:animations/animations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kings/utils/color.dart';
import 'package:kings/utils/extensions.dart';
import 'package:kings/widgets/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/nav_menu.dart';
import '../utils/router.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    bool isDesktop = MediaQuery.of(context).size.width > 810;

    List<Widget> cards = [
      //   _myCards(
      //       context,
      //       'Nurtora',
      //       'C.E.O, Founder',
      //       'Nurtora is a new software developing company that produces various apps as a means to provide solutions to many issues people are faced with',
      //       'nurtora.com',
      //       'https://nurtora.com/'),
      //   _myCards(
      //       context,
      //       'GospelCentrik',
      //       'C.E.O, Founder',
      //       'GospelCentrik is a platform that provides a wide range of services to the Christian community with the aim of promoting the gospel of Christ, making it easily accessible to everyone and bringing the Christian community together.',
      //       'gospelcentrik.com',
      //       'https://gospelcentrik.com'),
      //   _myCards(
      //       context,
      //       'Borku Africa',
      //       'CTO, Co-Founder',
      //       "Borku Africa is a  marketplace built for Africans in diaspora and African products enthusiasts",
      //       'bezaliohub.com',
      //       'https://bezaliohub.com/'),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[900],
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: OpenContainer(
          transitionDuration: const Duration(seconds: 1),
          closedElevation: 0,
          closedColor: Colors.transparent,
          openColor: Colors.black,
          transitionType: ContainerTransitionType.fade,
          tappable: false,
          closedBuilder: (context, action) {
            return Container(
              margin: const EdgeInsets.only(right: 40, top: 40),
              // alignment: Alignment.topRight,
              child: InkWell(
                  onTap: () {
                    action();
                  },
                  child: Icon(Icons.menu,
                      color: Colors.white, size: isMobile ? 35 : 40)),
            );
          },
          openBuilder: (context, action) {
            return NavMenu(
              action: action,
              routeName: Routes.aboutPage,
            );
          }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // body
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // about me (header)
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    alignment:
                        isDesktop ? Alignment.topLeft : Alignment.topCenter,
                    child: SelectableText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'About ',
                            style: TextStyle(
                              fontSize: isDesktop ? 80 : 60,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'Me',
                            style: TextStyle(
                              fontSize: isDesktop ? 80 : 60,
                              color: yellowColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment:
                        isDesktop ? Alignment.topLeft : Alignment.topCenter,
                    child: CustomText(
                      'Let me tell you a few things..',
                      fontSize: isDesktop ? 24 : 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // image and bio
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // image
                      if (isDesktop)
                        Container(
                          margin: const EdgeInsets.only(right: 50, left: 50),
                          alignment: Alignment.center,
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/stephen.png'),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle,
                              border: Border.all(color: yellowColor, width: 3)),
                        ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (!isDesktop)
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 15),
                                alignment: Alignment.center,
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/stephen.png'),
                                        fit: BoxFit.cover),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: yellowColor, width: 3)),
                              ),
                            // bio
                            SelectableText(
                              'BIO',
                              style: TextStyle(
                                fontSize: isDesktop ? 27 : 23,
                                color: yellowColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SelectableText(
                              '" I am a Flutter Developer with years of experience in designing, developing, and maintaining high-performance cross-platform mobile applications. I have deep expertise in Flutter, Dart, Firebase, and state management tools like BLoC and Provider. I excel at leading development teams, architecting scalable solutions, and delivering pixel-perfect UIs with seamless performance. I have a strong background in integrating RESTful APIs, real-time features, and deploying apps to both the Play Store and App Store. I’m passionate about optimizing development workflows, and driving innovation in mobile app development "',
                              style: TextStyle(
                                fontSize: isDesktop ? 24 : 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 50),
                  // in my free time
                  const SizedBox(height: 50),
                  CustomText("",
                      fontSize: isDesktop ? 24 : 0,
                      fontWeight: FontWeight.w500),
                  // projects
                  isDesktop
                      ? Row(children: cards)
                      : Column(
                          children: cards,
                        ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
            // footer
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Center(
                child: SelectableText(
                  '© 2024 Stephen Kings',
                  style: TextStyle(
                    fontSize: isDesktop ? 20 : 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _myCards(BuildContext context, String company, String position,
      String desc, String siteName, String url) {
    Color _color = Colors.white;
    bool isDesktop = MediaQuery.of(context).size.width > 810;

    if (isDesktop) {
      return Expanded(
        child: Container(
          height: 400,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            border: const Border(
              bottom: BorderSide(color: yellowColor, width: 3),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SelectableText(
                  company,
                  style: const TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SelectableText(
                  position,
                  style: const TextStyle(
                    fontSize: 12,
                    color: yellowColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SelectableText(
                  desc,
                  style: const TextStyle(
                    fontSize: 14.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SelectableText(
                    ' ',
                    style: TextStyle(
                      fontSize: 14.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SelectableText.rich(TextSpan(
                    text: siteName,
                    style: TextStyle(
                      fontSize: 14.5,
                      color: _color,
                      fontWeight: FontWeight.w500,
                    ),
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        if (kDebugMode) {
                          print('onTap');
                        }
                        if (!await launchUrl(Uri.parse(url)))
                          throw 'Could not launch $url';
                      },
                  )).moveUpOnHover
                ],
              )
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 400,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          border: const Border(
            bottom: BorderSide(color: yellowColor, width: 3),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SelectableText(
                company,
                style: const TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SelectableText(
                position,
                style: const TextStyle(
                  fontSize: 12,
                  color: yellowColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SelectableText(
                desc,
                style: const TextStyle(
                  fontSize: 14.5,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SelectableText(
                  'For more details, visit ',
                  style: TextStyle(
                    fontSize: 14.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SelectableText.rich(TextSpan(
                  text: siteName,
                  style: TextStyle(
                    fontSize: 14.5,
                    color: _color,
                    fontWeight: FontWeight.w500,
                  ),
                  mouseCursor: MaterialStateMouseCursor.clickable,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      if (kDebugMode) {
                        print('onTap');
                      }
                      if (!await launchUrl(Uri.parse(url)))
                        throw 'Could not launch $url';
                    },
                )).moveUpOnHover
              ],
            )
          ],
        ),
      );
    }
  }
}
