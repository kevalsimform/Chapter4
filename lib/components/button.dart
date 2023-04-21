import 'package:flutter/material.dart';

import '../constants.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.onTap, required this.isEnabled, required this.isBigger, required this.title});

  final void Function() onTap;
  final bool isEnabled;
  final bool isBigger;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).orientation == Orientation.landscape ? 50 : 20),
      child: FilledButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            isEnabled ? buttonColor : Colors.grey.shade100,
          ),
          foregroundColor: MaterialStateProperty.all(isEnabled ? buttonTitle : Colors.grey.shade500),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(),
            Text(
              title,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400, color: isEnabled ? buttonTitle : Colors.grey.shade500),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 10,
              weight: 30,
              color: isEnabled ? buttonTitle : Colors.grey.shade500,
            )
          ],
        ),
      ),
    );
  }
}
