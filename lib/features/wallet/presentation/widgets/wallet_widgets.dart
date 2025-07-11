import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletWidgets extends StatelessWidget {
  final VoidCallback sendMoney;

  const WalletWidgets({super.key, required this.sendMoney});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.h),
      child: Column(
        children: [
          _buildBalanceSection(context),
          SizedBox(height: 40.h),
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildBalanceSection(BuildContext context) {
    return Column(
      children: [
        Text(
          'Total Balance',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: const Color(0xFF666666),
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          '\$ 00.00',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: const Color(0xFF222222),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildActionButton(
          context,
          icon: Icons.add,
          label: 'Cards',
          onTap: sendMoney, // Replace with functionality
        ),
        SizedBox(width: 40.w),
        _buildActionButton(
          context,
          icon: Icons.payment_sharp,
          label: 'Pay',
          onTap: sendMoney, // Replace with functionality
        ),
        SizedBox(width: 40.w),
        _buildActionButton(
          context,
          icon: Icons.send,
          label: 'Send',
          onTap: sendMoney,
          rotateIcon: true,
        ),
      ],
    );
  }

  Widget _buildActionButton(
      BuildContext context, {
        required IconData icon,
        required String label,
        required VoidCallback onTap,
        bool rotateIcon = false,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: Center(
              child: rotateIcon
                  ? Transform.rotate(
                angle: -1, // ≈ -57.3 degrees
                child: Icon(icon,
                    color: Theme.of(context).primaryColor, size: 28.w),
              )
                  : Icon(icon,
                  color: Theme.of(context).primaryColor, size: 28.w),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: const Color(0xFF222222),
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
