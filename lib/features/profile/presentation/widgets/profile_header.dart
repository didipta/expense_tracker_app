import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Column(
          children: [
            SizedBox(height: 46.h),
            CircleAvatar(
              radius: 60.r,
              backgroundImage: AssetImage('asset/avatar.png',), // Replace with real image path
            ),
            SizedBox(height: 8.h),
            Text(
              "Enjelin Morgeana",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 8.h),
            Text(
              "@enjelin_morgeana",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color:Theme.of(context).primaryColor,fontWeight: FontWeight.w600),
            ),
          ],
        )
      ],
    );
  }
}
