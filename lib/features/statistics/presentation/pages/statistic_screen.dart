import 'package:flutter/material.dart';

import '../widgets/chart_card.dart';
import '../widgets/tab_selector.dart';
import '../widgets/top_spending_lis.dart';


class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

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
        title: const Text('Statistics', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.upload_outlined, color: Colors.black),
            onPressed: () {},
          )
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
              onTabChanged: (index) => setState(() => _selectedTabIndex = index),
              selectedType: _selectedType,
              onTypeChanged: (type) => setState(() => _selectedType = type),
            ),
            const SizedBox(height: 20),
            ChartCard(dataType: _selectedType),
            const SizedBox(height: 24),
            const Text('Top Spending', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Expanded(child: TopSpendingList()),
          ],
        ),
      ),
    );
  }
}
