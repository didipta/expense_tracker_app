import 'package:expense_tracker_app/shared/widgets/layout_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/profile_header.dart';
import '../widgets/profile_menu_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBody(child: Padding(
        padding: EdgeInsets.all(24.0.w),
        child: Column(
          children: [
            const ProfileHeader(),
            const SizedBox(height: 20),
            ProfileMenuTile(
              icon: Icons.card_giftcard,
              title: 'Invite Friends',
              onTap: () {},
            ),
            Divider(),
            ProfileMenuTile(
              icon: Icons.account_circle,
              title: 'Account info',
              onTap: () {},
            ),
            ProfileMenuTile(
              icon: Icons.security,
              title: 'Login and security',
              onTap: () {},
            ),
            ProfileMenuTile(
              icon: Icons.lock,
              title: 'Data and privacy',
              onTap: () {},
            ),
          ],
        ),
      ), appBar:Padding(
        padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 24.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
              size: 24.w,
            ),
            Text(
              'Profile',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.67.r),
                color: Colors.white.withOpacity(0.1),
              ),
              child: Icon(
                Icons.notifications_none_outlined,
                color: Colors.white,
                size: 24.w,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
