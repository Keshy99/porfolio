import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kings/utils/router.dart';
import 'package:kings/widgets/custom_btn.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // image
          Center(
            child: Container(
              height: 350,
              width: 500,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  image: AssetImage('404.gif'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          // heading
          Center(
              child: SelectableText("Page Not Found",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.white))),
          const SizedBox(height: 20),
          // body text
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: 600,
            child: SelectableText(
              "Sorry! The page you are looking for does not exist",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          // button
          Center(
            child: SizedBox(
                width: 300,
                child: CustomButton(
                    text: "Go Home", icon: CupertinoIcons.home, onPressed: () => context.go(Routes.homePage))),
          )
        ],
      ),
    );
  }
}
