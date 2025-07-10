import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({super.key});

  String getTimeBasedGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon';
    } else if (hour >= 17 && hour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  @override
  Widget build(BuildContext context) {
    final greeting = getTimeBasedGreeting();
    return Text(greeting+",",
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w500,
        color: Colors.white,
      )
    );
  }
}
