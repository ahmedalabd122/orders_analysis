import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class GraphWidget extends StatelessWidget {
  final Map<String, int> monthlyOrderCount;

  const GraphWidget({super.key, required this.monthlyOrderCount});

  @override
  Widget build(BuildContext context) {
    final months = context.locale.languageCode == 'en'
        ? monthlyOrderCount.keys.toList()
        : monthlyOrderCount.keys.toList().reversed.toList();
    final counts = context.locale.languageCode == 'en'
        ? monthlyOrderCount.values.toList()
        : monthlyOrderCount.values.toList().reversed.toList();
    return Directionality(
      textDirection: context.locale.languageCode == 'en'
          ? ui.TextDirection.ltr
          : ui.TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            minY: 0,
            maxY: counts.isEmpty
                ? 0
                : (counts.reduce((a, b) => a > b ? a : b) + 5).toDouble(),
            lineBarsData: [
              LineChartBarData(
                isCurved: true,
                curveSmoothness: 0.3,
                isStrokeCapRound: true,
                isStrokeJoinRound: true,
                dotData: FlDotData(show: false),
                spots: List.generate(
                  months.length,
                  (index) => FlSpot(
                    index.toDouble(),
                    counts[index].toDouble(),
                  ),
                ),
              )
            ],
            titlesData: FlTitlesData(
              topTitles: AxisTitles(),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  reservedSize: 32,
                  showTitles: context.locale.languageCode == 'ar',
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toInt().toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  reservedSize: 32,
                  showTitles: context.locale.languageCode == 'en',
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toInt().toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    );
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 100,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    if (value.toInt() < 0 || value.toInt() >= months.length) {
                      return Container();
                    }
                    final time = DateTime.parse('${months[value.toInt()]}-01');
                    return Expanded(
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          tr('date_format', namedArgs: {
                            'month': DateFormat.MMM(context.locale.toString())
                                .format(time),
                            'year': DateFormat.y(context.locale.toString())
                                .format(time),
                          }),
                          style: TextStyle(
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
          ),
        ),
      ),
    );
  }
}
