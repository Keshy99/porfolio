import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class ContactChannel {
  const ContactChannel({required this.label, required this.value, required this.icon, required this.url});

  final String label;
  final String value;
  final IconData icon;
  final String url;
}

class SocialLink {
  const SocialLink({required this.label, required this.asset, required this.url});

  final String label;
  final String asset;
  final String url;
}

class Service {
  const Service({required this.title, required this.description, required this.icon});

  final String title;
  final String description;
  final IconData icon;
}

abstract final class Profile {
  static const firstName = 'Stephen';
  static const lastName = 'Kings';
  static const fullName = '$firstName $lastName';
  static const photo = 'assets/stephen.png';
  static const email = 'kingsstephen99@gmail.com';

  static const tagline =
      'Flutter developer building high-performance, pixel-perfect apps for mobile, web and desktop.';

  static const bio =
      'I am a Flutter Developer with years of experience in designing, developing, and maintaining high-performance cross-platform mobile applications. I have deep expertise in Flutter, Dart, Firebase, and state management tools like BLoC and Provider. I excel at leading development teams, architecting scalable solutions, and delivering pixel-perfect UIs with seamless performance. I have a strong background in integrating RESTful APIs, real-time features, and deploying apps to both the Play Store and App Store. I’m passionate about optimizing development workflows, and driving innovation in mobile app development.';

  static const skills = [
    'Flutter',
    'Dart',
    'Firebase',
    'BLoC',
    'Provider',
    'REST APIs',
    'Real-time features',
    'Play Store & App Store',
  ];

  static const services = [
    Service(
      title: 'Web & web apps',
      description: 'Responsive websites and web applications.',
      icon: Icons.language_rounded,
    ),
    Service(
      title: 'Mobile apps',
      description: 'Cross-platform apps for Android and iOS.',
      icon: Icons.phone_iphone_rounded,
    ),
    Service(
      title: 'Desktop apps',
      description: 'Cross-platform apps for Windows, Linux and macOS.',
      icon: Icons.desktop_mac_rounded,
    ),
  ];

  static const socials = [
    SocialLink(label: 'LinkedIn', asset: 'assets/linkedin.png', url: 'https://www.linkedin.com/in/kings-s-557b8516b'),
    SocialLink(label: 'GitHub', asset: 'assets/github.png', url: 'https://github.com/Keshy99'),
  ];

  static const contacts = [
    ContactChannel(label: 'Email', value: email, icon: Icons.email_outlined, url: 'mailto:$email'),
    ContactChannel(
      label: 'Phone',
      value: '+234 817 355 2536',
      icon: Icons.phone_iphone_rounded,
      url: 'tel:+2348173552536',
    ),
    ContactChannel(
      label: 'Phone',
      value: '+234 812 466 1280',
      icon: Icons.phone_iphone_rounded,
      url: 'tel:+2348124661280',
    ),
    ContactChannel(
      label: 'WhatsApp',
      value: '+234 817 355 2536',
      icon: CommunityMaterialIcons.whatsapp,
      url: 'https://wa.me/2348173552536',
    ),
    ContactChannel(label: 'Telegram', value: '@stevenkingz', icon: Icons.telegram, url: 'https://t.me/stevenkingz'),
    ContactChannel(
      label: 'Discord',
      value: 'kings',
      icon: Icons.discord,
      url: 'https://discordapp.com/users/kingsoo7',
    ),
  ];
}
