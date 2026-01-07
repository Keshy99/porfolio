import 'package:animations/animations.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/color.dart';
import '../utils/nav_menu.dart';
import '../utils/router.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    bool _isMobile = MediaQuery.of(context).size.width < 600;
    bool _isDesktop = MediaQuery.of(context).size.width > 810;

    String _url = 'https://wa.me/2348173552536';
    String _tel1 = 'tel:+2348124661280';
    String _tel2 = 'tel:+2348173552536';
    String _email = 'mailto:kingsstephen99@gmail.com';

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
                      color: Colors.white, size: _isMobile ? 35 : 40)),
            );
          },
          openBuilder: (context, action) {
            return NavMenu(
              action: action,
              routeName: Routes.contactPage,
            );
          }),
      bottomNavigationBar: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Center(
          child: SelectableText(
            '© 2024 Stephen Kings',
            style: TextStyle(
              fontSize: _isDesktop ? 20 : 15,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 60),
                  alignment:
                      _isDesktop ? Alignment.topLeft : Alignment.topCenter,
                  child: SelectableText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Contact ',
                          style: TextStyle(
                            fontSize: _isDesktop ? 80 : 60,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: 'Me',
                          style: TextStyle(
                            fontSize: _isDesktop ? 80 : 60,
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
                      _isDesktop ? Alignment.topLeft : Alignment.topCenter,
                  child: SelectableText(
                    'You can reach me via any of the following channels:',
                    style: TextStyle(
                      fontSize: _isDesktop ? 24 : 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                buildContactPlatform('kingsstephen99@gmail.com', Icons.email,
                    () => launchUrl(Uri.parse(_email))),
                buildContactPlatform('+2348173552536', Icons.phone_iphone,
                    () => launchUrl(Uri.parse(_tel1))),
                buildContactPlatform('+2348124661280', Icons.phone_iphone,
                    () => launchUrl(Uri.parse(_tel2))),
                buildContactPlatform(
                    '+2348173552536', CommunityMaterialIcons.whatsapp,
                    () async {
                  if (!await launchUrl(Uri.parse(_url)))
                    throw 'Could not launch $_url';
                }),
                buildContactPlatform("stevenkingz", Icons.telegram,
                    () => launchUrl(Uri.parse('https://t.me/stevenkingz'))),
                buildContactPlatform(
                    "kings",
                    Icons.discord,
                    () => launchUrl(
                        Uri.parse('https://discordapp.com/users/kingsoo7'))),
              ],
            )),
      ),
    );
  }

  Widget buildContactPlatform(String text, IconData icon, Function()? onTap) {
    bool _isDesktop = MediaQuery.of(context).size.width > 810;

    return InkWell(
      onTap: onTap,
      splashColor: yellowColor,
      child: HoverCrossFadeWidget(
        cursor: SystemMouseCursors.click,
        duration: const Duration(milliseconds: 300),
        reverseDuration: const Duration(milliseconds: 300),
        firstCurve: Curves.bounceIn,
        secondCurve: Curves.bounceOut,
        firstChild: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(bottom: 20),
          height: 50,
          width: _isDesktop ? 500 : MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2.5),
          ),
          child: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                  fontSize: _isDesktop ? 20 : 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]),
          ),
        ),
        secondChild: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(bottom: 20),
          height: 53,
          width: _isDesktop ? 510 : MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: yellowColor,
            border: Border.all(color: Colors.white, width: 2.5),
          ),
          child: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                icon,
                color: Colors.black,
                size: 30,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
