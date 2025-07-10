import 'package:flutter/material.dart';

class TopSpendingList extends StatelessWidget {
  const TopSpendingList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_SpendingItem> items = [
      _SpendingItem('Starbucks', 'Jan 12, 2022', '- \$150.00', Icons.local_cafe, Colors.green),
      _SpendingItem('Transfer', 'Yesterday', '- \$85.00', Icons.sync_alt, Colors.purple),
      _SpendingItem('Youtube', 'Jan 16, 2022', '- \$11.99', Icons.ondemand_video, Colors.red),
    ];

    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, i) {
        final item = items[i];
        final isActive = i == 1;

        return Container(
          decoration: BoxDecoration(
            color: isActive ? Theme.of(context).primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            boxShadow: isActive
                ? [BoxShadow(color: Theme.of(context).primaryColor.withOpacity(0.2), blurRadius: 20, offset: const Offset(0, 20))]
                : [],
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              Icon(item.icon, color: isActive ? Colors.white : item.iconColor, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title,
                        style: TextStyle(
                          color: isActive ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(item.subtitle,
                        style: TextStyle(
                          color: isActive ? Colors.white70 : Colors.grey,
                          fontSize: 12,
                        )),
                  ],
                ),
              ),
              Text(item.amount,
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.red,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        );
      },
    );
  }
}

class _SpendingItem {
  final String title, subtitle, amount;
  final IconData icon;
  final Color iconColor;

  _SpendingItem(this.title, this.subtitle, this.amount, this.icon, this.iconColor);
}
