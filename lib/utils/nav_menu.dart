import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hovering/hovering.dart';
import 'package:kings/utils/color.dart';
import 'package:kings/utils/router.dart';

class NavMenu extends StatefulWidget {
  const NavMenu({super.key, required this.action, required this.routeName});
  final Function action;
  final String routeName;

  @override
  State<NavMenu> createState() => _NavMenuState();
}

class _NavMenuState extends State<NavMenu> {
  @override
  Widget build(BuildContext context) {
    bool _isTab = MediaQuery.of(context).size.width < 810 &&
        MediaQuery.of(context).size.width > 420;
    bool _isMobile = MediaQuery.of(context).size.width < 600;
    bool _isDesktop = MediaQuery.of(context).size.width > 810;

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(_isMobile
            ? 'assets/background.jpg'
            : _isTab
                ? 'assets/background.jpg'
                : 'assets/background.jpg'),
      )),
      child: Container(
        padding: const EdgeInsets.all(40),
        color: Colors.black.withOpacity(0.9),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      widget.action();
                    });
                  },
                  child: Icon(Icons.close,
                      color: Colors.white, size: _isMobile ? 35 : 40),
                ),
              ),
              SizedBox(height: _isMobile ? 20 : 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_isDesktop)
                    Container(
                      margin: const EdgeInsets.only(right: 200),
                      alignment: Alignment.center,
                      width: 250,
                      height: 350,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image:
                                  AssetImage('assets/stephen.png'),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                          border: Border.all(color: yellowColor, width: 3)),
                    ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!_isDesktop)
                        Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          alignment: Alignment.center,
                          width: 130,
                          height: 150,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/stephen.png'),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle,
                              border: Border.all(color: yellowColor, width: 3)),
                        ),
                      _menu('home', Routes.homePage),
                      _menu('about me', Routes.aboutPage),
                      _menu('my projects', Routes.projectsPage),
                      // _menu('pricing', Routes.pricingPage),
                      _menu('contact me', Routes.contactPage),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _menu(String _name, String _route) {
    bool _isMobile = MediaQuery.of(context).size.width < 600;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: HoverCrossFadeWidget(
        firstChild: TextButton(
          onPressed: (() {
            widget.action();
            context.go(_route);
          }),
          child: Text(_name.toUpperCase(),
              style: TextStyle(
                fontSize: _isMobile ? 20 : 30,
                color: widget.routeName == _route ? yellowColor : Colors.white,
                fontWeight: FontWeight.w500,
              )),
        ),
        secondChild: TextButton(
          onPressed: (() {
            widget.action();
            context.go(_route);
          }),
          child: Text(_name.toUpperCase(),
              style: TextStyle(
                fontSize: _isMobile ? 20 : 30,
                color: yellowColor,
                fontWeight: FontWeight.w500,
              )),
        ),
        duration: const Duration(milliseconds: 10),
        reverseDuration: const Duration(milliseconds: 10),
        firstCurve: Curves.elasticIn,
        secondCurve: Curves.elasticOut,
        sizeCurve: Curves.elasticInOut,
      ),
    );
  }
}
