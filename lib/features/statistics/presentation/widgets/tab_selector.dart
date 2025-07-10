import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabSelector extends StatelessWidget {
  final int selectedTab;
  final Function(int) onTabChanged;
  final String selectedType;
  final Function(String) onTypeChanged;

  const TabSelector({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = ['Day', 'Week', 'Month', 'Year'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < tabs.length; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () => onTabChanged(i),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 33.w),
                      decoration: BoxDecoration(
                        color: selectedTab == i ? Theme.of(context).primaryColor : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        tabs[i],
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: selectedTab == i ? Colors.white : Color(0xFF666666),
                          fontWeight: FontWeight.w400,
                        )
                      ),
                    ),
                  ),
                ),

            ],
          ),
        ),
        Container(
          height: 40.h,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color(0xFFCCCCCC), // light grey border
              width: 1,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: Colors.white,
              icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF666666)),
              value: selectedType,
              items: ['Expense', 'Income']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (v) => onTypeChanged(v!),
              style: const TextStyle(
                color: Color(0xFF666666),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),

      ],
    );
  }
}
