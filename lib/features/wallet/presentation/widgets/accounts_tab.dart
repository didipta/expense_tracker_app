import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountsTab extends StatefulWidget {
  const AccountsTab({super.key});

  @override
  State<AccountsTab> createState() => _AccountsTabState();
}

class _AccountsTabState extends State<AccountsTab> {
  int _isSelected = 1; // Default selected item (1 = Bank Link, 2 = Paypal)

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildAccountOption(
            icon: Icons.account_balance,
            title: "Bank Link",
            subtitle: "Connect your bank account to deposit & fund",
            selected: _isSelected == 1,
            onTap: () {
              setState(() {
                _isSelected = 1;
              });
            },
          ),
          const SizedBox(height: 16),
          _buildAccountOption(
            icon: Icons.account_balance_wallet_outlined,
            title: "Paypal",
            subtitle: "Connect your paypal account",
            selected: _isSelected == 2,
            onTap: () {
              setState(() {
                _isSelected = 2;
              });
            },
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Handle "Next" based on _isSelected
            },
            child: const Text("Next"),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool selected,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected
              ? Theme.of(context).primaryColor.withOpacity(0.1)
              : const Color(0xFFFAFAFA),
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Row(
          children: [
            Container(
              width: 60.w,
              height: 60.w,
              decoration: BoxDecoration(
                color: selected
                    ? Theme.of(context).primaryColor.withOpacity(0.1)
                    : const Color(0xFFF0F6F5),
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: Icon(
                icon,
                color: selected
                    ? Theme.of(context).primaryColor
                    : const Color(0xFF888888),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: selected
                          ? Theme.of(context).primaryColor
                          : const Color(0xFF888888),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: selected
                          ? Theme.of(context).primaryColor
                          : const Color(0xFF888888),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20.w),
            if (selected)
              Icon(Icons.check_circle,
                  color: Theme.of(context).primaryColor),
          ],
        ),
      ),
    );
  }
}
