import 'package:expense_tracker_app/features/home/presentation/pages/home_page.dart';
import 'package:expense_tracker_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:expense_tracker_app/features/statistics/presentation/pages/statistic_screen.dart';
import 'package:expense_tracker_app/features/wallet/presentation/pages/connect_wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainBottomNav extends StatefulWidget {
  const MainBottomNav({super.key});

  @override
  State<MainBottomNav> createState() => _MainBottomNavState();
}

class _MainBottomNavState extends State<MainBottomNav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var continer = [
      HomePage(),
     StatisticsScreen(
       onBackPressed:() {
          setState(() {
            _selectedIndex = 0;
          });
        },
     ),
      ConnectWalletScreen(
        onBackPressed: () {
          setState(() {
            _selectedIndex = 0;
          });
        },
      ),
      ProfileScreen(
        onBackPressed: () {
          setState(() {
            _selectedIndex = 0;
          });
        },
      )
    ];
    return Scaffold(
      body:continer[_selectedIndex],
      floatingActionButtonLocation:_selectedIndex==0 ?FloatingActionButtonLocation.centerDocked:null,
      floatingActionButton:_selectedIndex==0?SizedBox(
        width: 75.w,
        height: 75.h,
        child: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          shape: const CircleBorder(),
          elevation: 10.0,
          onPressed: () {
            // Action for central FAB
          },
          child: Icon(Icons.add, color: Colors.white, size: 38.sp),
        ),
      ): null,

      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        clipBehavior: Clip.antiAlias,
        elevation: 100.0,
        shadowColor: Colors.grey,
        height:80.h,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child:_selectedIndex==0? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            _buildNavItem(Icons.home, 0),
            _buildNavItem(Icons.bar_chart, 1),
            SizedBox(width: 75.w), // Space for the FAB
            _buildNavItem(Icons.account_balance_wallet_outlined, 2),
            _buildNavItem(Icons.person_outline, 3),
          ],
        ):Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildNavItem(Icons.home, 0),
            _buildNavItem(Icons.bar_chart, 1),// Space for the FAB
            _buildNavItem(Icons.account_balance_wallet_outlined, 2),
            _buildNavItem(Icons.person_outline, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final isSelected = _selectedIndex == index;
    return IconButton(
      icon: Icon(
        icon,
        size: 34.sp,
        color: isSelected ? Colors.deepPurple : Color(0xFFAAAAAA),
      ),
      onPressed: () => _onItemTapped(index),
    );
  }
}
