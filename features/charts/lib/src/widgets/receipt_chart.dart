import 'package:core_ui/core_ui.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/chart_item.dart';

class ReceiptChart extends StatelessWidget {
  final List<ChartItem> data;

  const ReceiptChart({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        const double barSpace = AppDimens.SIZE_12;
        final double width = constraints.maxWidth;
        final double barWidth = (width - (barSpace * (data.length + 1))) / data.length;

        return BarChart(
          BarChartData(
            gridData: const FlGridData(drawVerticalLine: false),
            borderData: FlBorderData(
              border: const Border(
                left: BorderSide(color: Colors.black54, width: 2),
                bottom: BorderSide(color: Colors.black54, width: 2),
              ),
            ),
            barGroups: List<BarChartGroupData>.generate(
              data.length,
              (int index) => BarChartGroupData(
                x: index,
                barsSpace: barSpace,
                barRods: <BarChartRodData>[
                  BarChartRodData(
                    toY: data[index].value,
                    width: barWidth,
                    color: colors.primary,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(AppDimens.BORDER_RADIUS_4),
                      topLeft: Radius.circular(AppDimens.BORDER_RADIUS_4),
                    ),
                  ),
                ],
              ),
              growable: false,
            ),
            titlesData: FlTitlesData(
              rightTitles: const AxisTitles(axisNameSize: 0),
              topTitles: const AxisTitles(axisNameSize: 0),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    return Text(
                      '$value',
                      style: AppFonts.bodyS.copyWith(color: Colors.black54),
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 32,
                  maxIncluded: false,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    return Text(
                      '${value.truncate()}',
                      style: AppFonts.bodyS.copyWith(color: Colors.black54),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
