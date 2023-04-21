import 'package:flutter/material.dart';
import '/screens/SignIn.dart';
import '/constants.dart';
import '../components/button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  void onButtonPressed() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignIn()));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: height * 0.4,
                  decoration: BoxDecoration(
                      gradient: gradient,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(width * 0.3), bottomRight: Radius.circular(width * 0.3))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.15, bottom: height * 0.03),
                  child: Text('Leafboard', style: titleStyle),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: height * 0.15),
                  child: Text('A platform built for a new way of working', style: subTitleStyle),
                ),
                ActionButton(
                  onTap: onButtonPressed,
                  isBigger: false,
                  isEnabled: true,
                  title: 'Get Started For Free',
                ),
              ],
            ),
            Positioned(
              top: height * 0.3,
              child: Material(
                elevation: 20,
                shadowColor: Colors.white70,
                borderRadius: BorderRadius.circular(height * 0.5),
                child: CircleAvatar(
                  radius: height * 0.1,
                  child: Image.asset(
                    logoPath,
                    height: height * 0.1,
                  ),
                  backgroundColor: Colors.grey.shade200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
