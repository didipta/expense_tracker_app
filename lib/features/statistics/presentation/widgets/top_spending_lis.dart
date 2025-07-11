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
            color: isActive ? Theme.of(context).primaryColor : Colors.black12.withOpacity(0.01),
            borderRadius: BorderRadius.circular(12),
            boxShadow: isActive
                ? [BoxShadow(color: Theme.of(context).primaryColor.withOpacity(0.2), blurRadius: 20, offset: const Offset(0, 20))]
                : [],
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: isActive ? Colors.white.withOpacity(0.1) : item.iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                  child: Icon(item.icon, color: isActive ? Colors.white : item.iconColor, size: 30)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: isActive ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                    ),
                    Text(item.subtitle,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: isActive ? Colors.white70 : const Color(0xFF666666),
                        )),
                  ],
                ),
              ),
              Text(item.amount,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: isActive ? Colors.white : (item.amount.startsWith('-') ? Colors.red : Colors.green),
                    fontWeight: FontWeight.w600,
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
