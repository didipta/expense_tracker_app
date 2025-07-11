import 'package:flutter/material.dart';

class WalletTabBar extends StatelessWidget {
  final TabController tabController;

  const WalletTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Dark background color
      decoration: BoxDecoration(
        color: Color(0xFFF4F6F6),
        borderRadius: BorderRadius.circular(50), // Rounded corners
      ),
      child: TabBar(
        dividerColor: Colors.transparent, // Hide the divider
        padding: EdgeInsets.symmetric(vertical:8.0,horizontal: 0), // Add horizontal padding
        controller: tabController,
        indicator: BoxDecoration(

          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        indicatorColor: Colors.transparent,
        labelColor: Color(0xFF666666), // Dark color for active tab text
        unselectedLabelColor: Color(0xFF666666), // Hide inactive tab text
        labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
           // Adjust font size as needed
        ),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        tabs:[
          Tab(child: Container(
            width: double.infinity,
            child: Center(child: Text("Cards")),
          )),
          Tab(child: Container(
            width: double.infinity,
            child: Center(child: Text("Accounts")),
          )),
        ],
      ),
    );
  }
}
