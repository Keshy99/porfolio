import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';
import 'package:kings/widgets/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/color.dart';
import '../utils/nav_menu.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import '../utils/router.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    bool _isMobile = MediaQuery.of(context).size.width < 600;
    bool _isDesktop = MediaQuery.of(context).size.width > 810;

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
              routeName: Routes.projectsPage,
            );
          }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 0),
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
                            text: 'My ',
                            style: TextStyle(
                              fontSize: _isDesktop ? 80 : 60,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'Projects',
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
                      'I have worked on a number of projects, some of which are listed below.',
                      style: TextStyle(
                        fontSize: _isDesktop ? 24 : 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  projectCards()
                ],
              ),
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Center(
                child: SelectableText(
                  '© 2025 stephen Kings',
                  style: TextStyle(
                    fontSize: _isDesktop ? 20 : 15,
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

  Widget projectCards() {
    bool _isTab = MediaQuery.of(context).size.width < 810 &&
        MediaQuery.of(context).size.width > 420;
    bool _isMobile = MediaQuery.of(context).size.width < 600;
    bool _isDesktop = MediaQuery.of(context).size.width > 810;

    return GridView.count(
      crossAxisCount: _isDesktop
          ? 3
          : _isTab
              ? 2
              : _isMobile
                  ? 1
                  : 3,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      childAspectRatio: _isMobile
          ? 0.8
          : _isTab
              ? 0.8
              : 1.2,
      children: [
        //herssa
        _buildProjectsCards([
          myImage('herssa/h.jpg'),
          myImage('herssa/add.jpg'),
          myImage('herssa/add2.jpg'),
          myImage('herssa/add3.jpg'),
          myImage('herssa/add4.jpg'),
          myImage('herssa/add5.jpg'),
          myImage('herssa/add6.jpg'),
        ],
            'Herssa',
            'A real time Travel AI application where you can book flights and hotels both local and international by chatting with the AI bot, it books the flights and hotels for you based on your preferences. It also has other interesting features like language translation, live interactive voice sessions with the bot and many more.',
            'https://play.google.com/store/apps/details?id=com.hermextravels.herssa',
            isApp: true, isWeb: false, fit: BoxFit.contain),

        //hermex travels
        _buildProjectsCards([
          myImage('hermex/ss1.png'),
          myImage('hermex/ss2.png'),
          myImage('hermex/ss3.png'),
          myImage('hermex/ss4.png'),
          myImage('hermex/ss5.png'),
          myImage('hermex/ss6.png'),
          myImage('hermex/ss7.png'),
          myImage('hermex/ss8.png'),
          myImage('hermex/ss9.png'),
          myImage('hermex/ss10.png'),
          myImage('hermex/ss11.png'),
          myImage('hermex/ss12.png'),
          myImage('hermex/ss13.png'),
          myImage('hermex/ss14.png'),
        ],
            'Hermex Travels',
            'A real time Travel application where you can book flights and hotels both local and international,with other interesting features.',
            'https://play.google.com/store/apps/details?id=com.hermex.hermex_travels',
            isApp: true, isWeb: false, fit: BoxFit.contain),

        //Excel Mind
        _buildProjectsCards([
          myImage('excelmind/excel.png'),
        ],
            'Excel Mind',
            'An Ed-Tech platform that delivers educational and learning  solutions to school operations. It provides a platform for students, teachers, and parents to interact and manage academic activities effectively.',
            "https://play.google.com/store/apps/details?id=com.avancier.excelminds.excel_minds",
            isApp: true, isWeb: false, fit: BoxFit.contain),
        //Golden Credit
        _buildProjectsCards([
          myImage('sdd/sdd.png'),
        ],
            'Golden Credit',
            'A Fintech platform for sending and receiving money, and paying for every bill in real time.',
            "https://play.google.com/store/apps/details?id=com.goldencredit.ng",
            isApp: true, isWeb: false, fit: BoxFit.contain),

        // Blott
        _buildProjectsCards([
          myImage('blott/1.jpg'),
          myImage('blott/2.jpg'),
          myImage('blott/3.jpg'),
          myImage('blott/4.jpg'),
          myImage('blott/5.jpg'),
          myImage('blott/6.jpg'),
          myImage('blott/7.jpg'),
        ],
            'Blott',
            'A real time news application that fetches live streams from a database source, and when any news is clicked on the app it  navigates to the news feed on chrome(or any default browser)wheere all the details are displayed. this was achieved by using a library called URL LAUNCHER.',
            'https://firebasestorage.googleapis.com/v0/b/general-stuff-e3630.appspot.com/o/blott.zip?alt=media&token=61a80b01-194f-45f1-b828-ad325cc834f8',
            isApp: true, isWeb: false, fit: BoxFit.contain),

        // cardza
        _buildProjectsCards([
          myImage('cardza/1.jpg'),
          myImage('cardza/2.jpg'),
          myImage('cardza/3.jpg'),
          myImage('cardza/4.jpg'),
          myImage('cardza/5.jpg'),
          myImage('cardza/6.jpg'),
          myImage('cardza/7.jpg'),
          myImage('cardza/8.jpg'),
          myImage('cardza/9.jpg'),
          myImage('cardza/10.jpg'),
          myImage('cardza/11.jpg'),
        ],
            'Cardza',
            'A real time gift card trading platform where users can trade thier gift cards. Come with an Admin panel. It was built with Flutter and firebase as the backend. ',
            'https://firebasestorage.googleapis.com/v0/b/general-stuff-e3630.appspot.com/o/cardZa.zip?alt=media&token=7aec28eb-9325-4df7-a310-96b10d550edb',
            isApp: true, isWeb: false, fit: BoxFit.contain),
        // K chat
        _buildProjectsCards([
          myImage('chatapp/3.jpg'),
          myImage('chatapp/4.jpg'),
          myImage('chatapp/3.jpg'),
          myImage('chatapp/5.jpg'),
          myImage('chatapp/1.jpg'),
          myImage('chatapp/9.jpg'),
          myImage('chatapp/13.jpg'),
          myImage('chatapp/10.jpg'),
          myImage('chatapp/7.jpg'),
          myImage('chatapp/8.jpg'),
          myImage('chatapp/6.jpg'),
          myImage('chatapp/2.jpg'),
          myImage('chatapp/17.jpg'),
          myImage('chatapp/14.jpg'),
          myImage('chatapp/12.jpg'),
          myImage('chatapp/11.jpg'),
        ],
            'K Chat',
            'A real time chatting application that aloows sending messages and images, with some basic features like otp verification and reset password amongst others. It was built with Flutter and firebase as the backend. ',
            'https://firebasestorage.googleapis.com/v0/b/general-stuff-e3630.appspot.com/o/app-release.zip?alt=media&token=27c4ae12-48a5-4d52-8b07-6c0f7310c0c7',
            isApp: true, isWeb: false, fit: BoxFit.contain),
        // ticket app
        _buildProjectsCards([
          myImage('ticketapp/2.jpg'),
          myImage('ticketapp/1.jpg'),
          myImage('ticketapp/3.jpg'),
          myImage('ticketapp/4.jpg'),
          myImage('ticketapp/5.jpg'),
          myImage('ticketapp/8.jpg'),
          myImage('ticketapp/6.jpg'),
          myImage('ticketapp/7.jpg'),
        ],
            'Ticket App',
            'This project is a basic user interface of a flight ticket booking application with hotel preview and bookings ',
            'https://firebasestorage.googleapis.com/v0/b/general-stuff-e3630.appspot.com/o/ticketapp.zip?alt=media&token=a9f73c90-fef9-4b8b-8bbe-d600d31e1c2d',
            isWeb: false, isApp: true, fit: BoxFit.contain),
        // meals
        _buildProjectsCards([
          myImage('meals/1.jpg'),
          myImage('meals/2.jpg'),
          myImage('meals/3.jpg'),
          myImage('meals/4.jpg'),
          myImage('meals/5.jpg'),
        ], 'Cookerey E-Book', 'A cookery E-book application',
            'https://firebasestorage.googleapis.com/v0/b/general-stuff-e3630.appspot.com/o/meals.zip?alt=media&token=2778702c-e735-4545-b820-838f219f3d5c',
            isWeb: false, isApp: true, fit: BoxFit.contain),

        //Stripe
        _buildProjectsCards([
          'assets/stripe/1.jpg',
        ],
            'Stripe Payment Gateway',
            'A real time functioning implementation of stripe payment gateway.. ',
            'https://firebasestorage.googleapis.com/v0/b/general-stuff-e3630.appspot.com/o/stripe.zip?alt=media&token=4dd26790-0502-42f3-8eb7-b2d4aad5e6e4',
            isApp: true, isWeb: false, fit: BoxFit.contain),

        // expense tracker
        _buildProjectsCards([
          'assets/expensetracker/1.jpg',
          'assets/expensetracker/2.jpg',
        ],
            'Expense Tracker',
            ' This application keeps record of your budget for you to monitor your spendings',
            'https://firebasestorage.googleapis.com/v0/b/general-stuff-e3630.appspot.com/o/expense%20tracker.zip?alt=media&token=de1ccf06-a412-4940-a691-53b2c276ef77',
            isApp: true, isWeb: true, fit: BoxFit.contain),
        // bezalio
        // _buildProjectsCards([
        //   'assets/bezalio/1.JPG',
        //   'assets/bezalio/2.JPG',
        //   'assets/bezalio/3.JPG',
        //   'assets/bezalio/4.JPG',
        //   'assets/bezalio/5.jfif',
        //   'assets/bezalio/6.jfif',
        //   'assets/bezalio/7.jfif',
        //   'assets/bezalio/8.jfif',
        // ],
        //     'Bezalio Hub',
        //     'Bezalio Hub is a market place for products and home services with their primary market being the American and European States.',
        //     'https://bezaliohub.com/',
        //     isApp: true, isWeb: true),
        // borku
        // _buildProjectsCards([
        //   'assets/borku/1.JPG',
        //   'assets/borku/2.jfif',
        //   'assets/borku/3.jfif',
        //   'assets/borku/4.jfif',
        //   'assets/borku/5.jfif',
        //   'assets/borku/6.jfif',
        //   'assets/borku/7.jfif',
        //   'assets/borku/8.jfif',
        // ],
        //     'Borku Africa',
        //     'Borku Africa is an online marketplace for where all Africans in diaspora can buy and sell African products and services., ',
        //     'https://borkuafrica.com/',
        //     isApp: true, isWeb: true),
        // inaspace
//         _buildProjectsCards(
//             [
//               'assets/inaspace/1.JPG',
//               'assets/inaspace/2.JPG',
//               'assets/inaspace/3.JPG',
//               'assets/inaspace/4.JPG',
//               'assets/inaspace/5.JPG',
//             ],
//             'Inaspace Design',
//             '''Iná Space Design is an Interior Design firm in Lagos, Nigeria. We design and deliver high-end, exquisite interiors designs for our clients for their residences, offices, events, etc to suit lifestyle as well as other purposes.
// We are also open for consultation, whereby we help you plan and make designs that are most suitable for your business and homes, thus facilitating comfort and customer attraction as the case may be.''',
//             'https://inaspacedesign.com/',
//             isApp: false,
//             isWeb: true),
        // petonyx
//         _buildProjectsCards(
//             [
//               'assets/petonyx/1.JPG',
//               'assets/petonyx/2.JPG',
//               'assets/petonyx/3.JPG',
//               'assets/petonyx/4.JPG',
//               'assets/petonyx/5.JPG',
//             ],
//             'Petonyx Educational Consult',
//             '''Petonyx Educational Consult is an Organization established in 2018 with a mission to deliver exceptional International educational consulting services to students, parents and secondary schools.

// We do this by giving a unique yet simple curriculum and modules of each examination, detailed explanation of each module and guide to passing examination , we teach using a comprehensive mark guide of each examination to ensure students pass their examination in just one sitting.''',
//             'https://petonyx.com/',
//             isApp: false,
//             isWeb: true),
        // rightdeal
        // _buildProjectsCards([
        //   'assets/rightdeal/1.JPG',
        //   'assets/rightdeal/2.JPG',
        //   'assets/rightdeal/3.JPG',
        //   'assets/rightdeal/4.JPG',
        // ],
        //     'RightDeal Consulting',
        //     'RightDeal Consulting Limited is a firm that provides lots of services to see that small to large businesses grow and increase revenue. To this effect, we offer a wide range of services such as Business consulting, increasing customer base, brand and services promotion, market research, job recruiting, just to mention a few.',
        //     'https://rightdealconsulting.com/',
        //     isApp: false, isWeb: true),
      ],
    );
  }

  Widget _buildProjectsCards(
      List<String> images, String title, String desc, String url,
      {required bool isWeb, required bool isApp, BoxFit? fit}) {
    bool _isMobile = MediaQuery.of(context).size.width < 600;
    return Column(
      children: [
        // image
        OpenContainer(
            transitionDuration: const Duration(seconds: 1),
            closedElevation: 0,
            closedColor: Colors.transparent,
            openColor: Colors.black,
            transitionType: ContainerTransitionType.fadeThrough,
            closedBuilder: (context, action) {
              return HoverAnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 200,
                width: 400,
                hoverHeight: 203,
                hoverWidth: 403,
                // hoverColor: yellowColor,
                duration: const Duration(milliseconds: 500),
                cursor: SystemMouseCursors.click,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  image: DecorationImage(
                    image: AssetImage(images[0]),
                    fit: fit ?? BoxFit.fill,
                  ),
                ),
                hoverDecoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: yellowColor,
                    width: 2,
                  ),
                  image: DecorationImage(
                    image: AssetImage(images[0]),
                    fit: BoxFit.fill,
                  ),
                ),
                foregroundDecoration:
                    const BoxDecoration(color: Colors.transparent),
                hoverForegroundDecoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                ),
              );
            },
            openBuilder: (context, action) {
              return Scaffold(
                backgroundColor: Colors.black,
                body: SingleChildScrollView(
                    child: Padding(
                  padding: EdgeInsets.all(_isMobile ? 5 : 30),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: _isMobile ? 25 : 0, right: _isMobile ? 25 : 0),
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              action();
                            });
                          },
                          child: const Icon(Icons.close,
                              color: Colors.white, size: 40),
                        ),
                      ),
                      const SizedBox(height: 100),
                      projectImages(images, context)
                    ],
                  ),
                )),
              );
            }),
        // title btn and description modal
        OpenContainer(
            transitionDuration: const Duration(seconds: 1),
            closedElevation: 0,
            closedColor: Colors.transparent,
            openColor: Colors.black,
            transitionType: ContainerTransitionType.fade,
            closedBuilder: (context, action) {
              return HoverAnimatedContainer(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                height: 40,
                width: 400,
                color: Colors.grey,
                hoverColor: yellowColor,
                duration: const Duration(milliseconds: 200),
                cursor: SystemMouseCursors.click,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.info, color: Colors.black, size: 25),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      getIcon(isWeb: isWeb, isApp: isApp)
                    ],
                  ),
                ),
              );
            },
            openBuilder: (context, action) {
              return Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(images[0]),
                  fit: BoxFit.cover,
                )),
                child: Container(
                  color: Colors.black.withOpacity(0.93),
                  child: CupertinoAlertDialog(
                    title: CustomText(
                      'About $title',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    content: CustomText(
                      desc,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      textAlign: TextAlign.center,
                    ),
                    actions: [
                      CupertinoDialogAction(
                        child: Text(
                          'Close',
                          style: GoogleFonts.kurale(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            action();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            }),
        // preview button
        OpenContainer(
            transitionDuration: const Duration(seconds: 1),
            closedElevation: 0,
            closedColor: Colors.transparent,
            openColor: Colors.black,
            transitionType: ContainerTransitionType.fade,
            closedBuilder: (context, action) {
              return HoverAnimatedContainer(
                margin: const EdgeInsets.only(bottom: 5, right: 5, left: 5),
                height: 40,
                width: 400,
                color: Colors.grey[700],
                hoverColor: yellowColor,
                duration: const Duration(milliseconds: 200),
                cursor: SystemMouseCursors.click,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.view_carousel_outlined,
                          color: Colors.white, size: 25),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Preview',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            openBuilder: (context, action) {
              return Scaffold(
                backgroundColor: Colors.black,
                body: SingleChildScrollView(
                    child: Padding(
                  padding: EdgeInsets.all(_isMobile ? 5 : 30),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: _isMobile ? 25 : 0, right: _isMobile ? 25 : 0),
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              action();
                            });
                          },
                          child: const Icon(Icons.close,
                              color: Colors.white, size: 40),
                        ),
                      ),
                      const SizedBox(height: 100),
                      projectImages(images, context)
                    ],
                  ),
                )),
              );
            }),
        // redirect
        InkWell(
          onTap: () async {
            if (url.length < 3) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: CustomText(
                  'Sorry, this site is currently offline!!!',
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.red,
              ));
            } else {
              if (!await launchUrl(Uri.parse(url)))
                throw 'Could not launch $url';
            }
          },
          child: HoverAnimatedContainer(
            height: 40,
            width: 400,
            color: Colors.black,
            hoverColor: yellowColor,
            duration: const Duration(milliseconds: 200),
            cursor: SystemMouseCursors.click,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.web, color: Colors.white, size: 25),
                  const SizedBox(
                    width: 10,
                  ),
                  SelectableText(
                    !isWeb ? 'Download' : 'Download',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget projectImages(List<String> images, BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    return Row(
      children: [
        Container(
            width: isMobile ? 25 : 50,
            margin: const EdgeInsets.only(right: 5),
            child: Center(
              child: InkWell(
                onTap: () {
                  _controller.previousPage();
                },
                child: const Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
            )),
        Expanded(
          child: CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (
              context,
              index,
              // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
              Null,
            ) {
              return InkWell(
                onTap: () {
                  final imageProvider = Image.asset(images[index]).image;
                  showImageViewer(context, imageProvider,
                      onViewerDismissed: () {});
                },
                onDoubleTap: () {
                  final imageProvider = Image.asset(images[index]).image;
                  showImageViewer(context, imageProvider,
                      onViewerDismissed: () {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(images[index]),
                      // fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
                height: isMobile ? 400 : null,
                autoPlay: false,
                // enlargeCenterPage: true,
                viewportFraction: 1,
                aspectRatio: 16 / 9),
            carouselController: _controller,
          ),
        ),
        Container(
            width: isMobile ? 25 : 50,
            margin: const EdgeInsets.only(left: 5),
            child: Center(
              child: InkWell(
                onTap: () {
                  _controller.nextPage();
                },
                child: const Icon(Icons.arrow_forward_ios, color: Colors.white),
              ),
            )),
      ],
    );
  }

  Widget getIcon({required bool isWeb, required bool isApp}) {
    return Row(
      children: [
        // web icon
        Visibility(visible: isWeb, child: projectIcon(Icons.code)),
        // space
        Visibility(
          visible: isWeb,
          child: const SizedBox(width: 5),
        ),
        // android icon
        Visibility(visible: isApp, child: projectIcon(Icons.android)),
        // space
        Visibility(
          visible: isApp,
          child: const SizedBox(width: 5),
        ),
        // ios icon
        Visibility(visible: isApp, child: projectIcon(Icons.apple)),
      ],
    );
  }

  Icon projectIcon(IconData icon) {
    return Icon(
      icon,
      color: Colors.black,
      size: 25,
    );
  }

  String myImage(String image) {
    if (kDebugMode) {
      return image;
    } else {
      return 'assets/$image';
    }
  }
}
