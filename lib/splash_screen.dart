import 'package:flutter/material.dart';
import 'package:just_do_it/components/constants.dart';
import 'package:just_do_it/components/custom_progress_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 150,
            // height: 150,
            fit: BoxFit.contain,
          ),
          Text(
            "TaskTrove",
            style: titleTextStyle(
              color: white,
              fontWeight: FontWeight.w500,
              fontSize: 45,
            ),
          ),
          Text(
            "Every Journey begins with a single To-do",
            style: subTitleTextStyle(
              color: darkMainColor,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          CustomProgressIndicator(
            primaryColor: darkMainColor,
            secondaryColor: darkMainColor.withOpacity(0.15),
            radius: 32,
            duration: 2000,
            stroke: 3,
          ),
        ],
      ),
    );
  }
}
