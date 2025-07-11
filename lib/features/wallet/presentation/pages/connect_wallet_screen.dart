import 'package:expense_tracker_app/shared/widgets/layout_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/wallet_tab_bar.dart';
import '../widgets/cards_tab.dart';
import '../widgets/accounts_tab.dart';
import '../widgets/wallet_widgets.dart';

class ConnectWalletScreen extends StatefulWidget {
  final VoidCallback onBackPressed;

  const ConnectWalletScreen({super.key, required this.onBackPressed});

  @override
  State<ConnectWalletScreen> createState() => _ConnectWalletScreenState();
}

class _ConnectWalletScreenState extends State<ConnectWalletScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBody(
        appBar: _buildAppBar(context),
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.w),
              topRight: Radius.circular(30.w),
            ),
          ),
          child: _isSending ? _buildTabSection() : _buildWalletIntro(),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: _isSending ? () {
              setState(() {
                _isSending = false;
              });
            } : widget.onBackPressed,
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
              size: 24.w,
            ),
          ),
          Text(
            !_isSending?'Wallet': 'Connect Wallet',
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

  Widget _buildWalletIntro() {
    return WalletWidgets(
      sendMoney: () {
        setState(() {
          _isSending = true;
        });
      },
    );
  }

  Widget _buildTabSection() {
    return Column(
      children: [
        WalletTabBar(tabController: _tabController),
        SizedBox(height: 12.h),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              CardsTab(),
              AccountsTab(),
            ],
          ),
        ),
      ],
    );
  }
}
