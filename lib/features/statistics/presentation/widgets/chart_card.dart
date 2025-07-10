import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartCard extends StatelessWidget {
  final String dataType;

  const ChartCard({super.key, required this.dataType});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<FlSpot>> chartData = {
      'Expense': [
        FlSpot(0, 500),
        FlSpot(1, 700),
        FlSpot(2, 1230),
        FlSpot(3, 900),
        FlSpot(4, 1300),
        FlSpot(5, 1100),
        FlSpot(6, 1200),
      ],
      'Income': [
        FlSpot(0, 800),
        FlSpot(1, 950),
        FlSpot(2, 1000),
        FlSpot(3, 1200),
        FlSpot(4, 1400),
        FlSpot(5, 1350),
        FlSpot(6, 1500),
      ],
    };

    final spots = chartData[dataType]!;

    return SizedBox(
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          LineChart(
            LineChartData(
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
              minY: 0,
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    reservedSize: 30,
                    getTitlesWidget: (value, _) {
                      const months = ['Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'];
                      return Text(
                        value.toInt() >= 0 && value.toInt() < months.length
                            ? months[value.toInt()]
                            : '',
                        style: const TextStyle(fontSize: 12, color: Color(0xFF666666)),
                      );
                    },
                  ),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  color: Theme.of(context).primaryColor,
                  barWidth: 3,
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, barData, index) {
                      return FlDotCirclePainter(
                        radius: 4,
                        color: Theme.of(context).primaryColor,
                        strokeWidth: 1,
                        strokeColor: Colors.white,
                      );
                    },
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [Theme.of(context).primaryColor.withOpacity(0.2), Colors.transparent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
              lineTouchData: LineTouchData(
                enabled: true,
                touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (touchedSpot) => Theme.of(context).primaryColor,
                  fitInsideHorizontally: true,
                  fitInsideVertically: true,
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((spot) {
                      return LineTooltipItem(
                        '\$${spot.y.toInt()}',
                        TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      );
                    }).toList();
                  },
                ),
              ),
            ),
          ),
          // Positioned(
          //   left: MediaQuery.of(context).size.width * 0.6,
          //   top:10,
          //   child: Column(
          //     children: [
          //       Container(
          //         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //           border: Border.all(color: Colors.deepPurple),
          //           borderRadius: BorderRadius.circular(4),
          //         ),
          //         child: Text('\$${spots[2].y.toInt()}',
          //             style: const TextStyle(color: Colors.deepPurple)),
          //       ),
          //       const SizedBox(height: 4),
          //       Container(width: 1, height: 50, color: Colors.deepPurple),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
