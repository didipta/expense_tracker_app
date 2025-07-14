import 'package:expense_tracker_app/features/profile/presentation/widgets/profile_edit_view.dart';
import 'package:expense_tracker_app/features/profile/presentation/widgets/profile_info_view.dart';
import 'package:expense_tracker_app/shared/widgets/layout_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/language_widget.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_menu_tile.dart';

class ProfileScreen extends StatefulWidget {
  Function ? onBackPressed;
  ProfileScreen({super.key, this.onBackPressed});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var container = [
      buildProfileMainpart(),
      ProfileInfoView(
        onEditPressed: () {
          setState(() {
            selectedIndex = 2;
          });
        },
      ),
      ProfileEditView(),
    ];

    return Scaffold(
      body: LayoutBody(
        appBar: buildCustomAppBar(context),
        child: Padding(
          padding: EdgeInsets.all(24.0.w),
          child: Column(
            children: [
              const ProfileHeader(),
              container[selectedIndex],
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileMainpart() {
    return Column(
      children: [
        const SizedBox(height: 20),
        ProfileMenuTile(
          icon: Icons.diamond,
          title: 'Invite Friends',
          onTap: () {
            // Placeholder action
          },
        ),
        const Divider(),
        ProfileMenuTile(
          icon: Icons.account_circle,
          title: 'Account info',
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
        ),
        ProfileMenuTile(
          icon: Icons.security,
          title: 'Login and security',
          onTap: () {
            context.go("/login");
          },
        ),
        ProfileMenuTile(
          icon: Icons.lock,
          title: 'Data and privacy',
          onTap: () {},
        ),
        LanguageWidget(),
      ],
    );
  }

  Widget buildCustomAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           GestureDetector(
          onTap: () {
            if (widget.onBackPressed != null && selectedIndex== 0) {
              widget.onBackPressed!();
            } else {
              setState(() {
                selectedIndex = 0;
              });
            }
    },
               child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white)),
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
    );
  }
}
