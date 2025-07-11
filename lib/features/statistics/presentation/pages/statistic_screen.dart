import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/chart_card.dart';
import '../widgets/tab_selector.dart';
import '../widgets/top_spending_lis.dart';

class StatisticsScreen extends StatefulWidget {
  Function onBackPressed;
  StatisticsScreen({super.key, required this.onBackPressed});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  int _selectedTabIndex = 0;
  String _selectedType = 'Expense';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
          onPressed: () => {
            widget.onBackPressed(),
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_alt_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabSelector(
              selectedTab: _selectedTabIndex,
              onTabChanged: (index) =>
                  setState(() => _selectedTabIndex = index),
              selectedType: _selectedType,
              onTypeChanged: (type) => setState(() => _selectedType = type),
            ),
            const SizedBox(height: 20),
            ChartCard(dataType: _selectedType),
            const SizedBox(height: 24),
            Row(
              children: [
                Text(
                  'Top Spending',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(0, 0),
                  ),
                  onPressed: () {},
                  child: Transform.rotate(
                    angle: 90 * 3.1416 / 180, // convert degrees to radians
                    child: Icon(
                      Icons.sync_alt_outlined,
                      color: Colors.black54,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Expanded(child: TopSpendingList()),
          ],
        ),
      ),
    );
  }
}
