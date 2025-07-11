import 'package:expense_tracker_app/shared/widgets/layout_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/wallet_tab_bar.dart';
import '../widgets/cards_tab.dart';
import '../widgets/accounts_tab.dart';

class ConnectWalletScreen extends StatefulWidget {
  const ConnectWalletScreen({super.key});

  @override
  State<ConnectWalletScreen> createState() => _ConnectWalletScreenState();
}

class _ConnectWalletScreenState extends State<ConnectWalletScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: LayoutBody(
       appBar: Container(
         padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 12.h, bottom: 24.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Text(
                'Connect Wallet',
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
                child: Icon(Icons.notifications_none_outlined,
                  color: Colors.white,
                  size: 24.w,
                ),
              )
              // Placeholder for the right side
            ],
          ),
       ),
       child: Container(
         height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.w),
              topRight: Radius.circular(30.w),
            ),
          ),
         child: Column(
           children: [
             WalletTabBar(tabController: _tabController),
             Flexible(
               child: TabBarView(
                 controller: _tabController,
                 children: const [
                   CardsTab(),
                   AccountsTab(),
                 ],
               ),
             ),
           ],
         ),
       ),
     ),
    );
  }
}
