import 'package:flutter/material.dart';

import 'user_profile.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(8),
      height: size.height / 18,
      width: size.width / 1.08,
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade600.withOpacity(0.4),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/searchWeather');
            },
            child: Text(
              "Search weather by name",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const UserProfile()
        ],
      ),
    );
  }
}
