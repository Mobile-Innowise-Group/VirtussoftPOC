import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/chart_item.dart';

class ReceiptDotChart extends StatelessWidget {
  final List<ChartItem> data;

  const ReceiptDotChart({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const ClampingScrollPhysics(),
          child: Container(
            height: 400,
            width: data.length * 60,
            constraints: BoxConstraints(minWidth: constraints.maxWidth),
            child: LineChart(
              LineChartData(
                lineTouchData: const LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipColor: _getTooltipColor,
                    getTooltipItems: _getTooltipItems,
                  ),
                ),
                gridData: FlGridData(
                  getDrawingVerticalLine: _getDrawingVerticalLine,
                  getDrawingHorizontalLine: _getDrawingHorizontalLine,
                  verticalInterval: 1,
                ),
                lineBarsData: <LineChartBarData>[
                  LineChartBarData(
                    color: colors.primary,
                    spots: List<FlSpot>.generate(
                      data.length,
                      (int index) => FlSpot(
                        index.toDouble(),
                        data[index].value,
                      ),
                    ),
                    isCurved: true,
                    isStrokeCapRound: true,
                    preventCurveOverShooting: true,
                  ),
                ],
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 50,
                      maxIncluded: false,
                      minIncluded: false,
                      getTitlesWidget: _getSpendingTitlesWidget,
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: _getEmptyTitlesWidget,
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: _getEmptyTitlesWidget,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      interval: 1,
                      getTitlesWidget: _getDateTitlesWidget,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: const Border(
                    left: BorderSide(),
                    top: BorderSide(color: Color.fromRGBO(180, 180, 180, 1)),
                    right: BorderSide(color: Color.fromRGBO(180, 180, 180, 1)),
                    bottom: BorderSide(),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget _getEmptyTitlesWidget(_, __) => const SizedBox();

  static Widget _getSpendingTitlesWidget(double value, _) {
    return Text(
      '${value.toInt()}',
      style: AppFonts.bodyM.copyWith(color: Colors.black),
      textAlign: TextAlign.center,
    );
  }

  Widget _getDateTitlesWidget(double value, _) {
    final int index = value.toInt();

    if (index < 0 || index >= data.length) {
      return const SizedBox();
    }

    final DateTime curr = data[index].date;
    final DateTime? prev = index == 0 ? null : data[index - 1].date;

    final String monthLabel = DateFormat('MMM').format(curr);

    if (prev != null && prev.year != curr.year) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            monthLabel,
            style: AppFonts.bodyM.copyWith(color: Colors.black),
          ),
          Text(
            DateFormat('yyyy').format(curr),
            style: AppFonts.bodyM.copyWith(color: Colors.black),
          ),
        ],
      );
    }

    return Center(
      child: Text(
        monthLabel,
        style: AppFonts.bodyM.copyWith(color: Colors.black),
      ),
    );
  }

  static FlLine _getDrawingHorizontalLine(_) {
    return const FlLine(
      color: Color.fromRGBO(180, 180, 180, 0.5),
      strokeWidth: 1,
      dashArray: <int>[8, 4],
    );
  }

  FlLine _getDrawingVerticalLine(double value) {
    final int index = value.toInt();

    if (index < 0 || index >= data.length) {
      return const FlLine(color: Colors.transparent);
    }

    final DateTime curr = data[index].date;
    final DateTime? prev = index == 0 ? null : data[index - 1].date;

    if (prev != null && prev.year != curr.year) {
      return const FlLine(
        color: Color.fromRGBO(180, 180, 180, 1),
        dashArray: <int>[8, 4],
      );
    }

    return const FlLine(
      color: Color.fromRGBO(180, 180, 180, 0.5),
      strokeWidth: 1,
      dashArray: <int>[8, 4],
    );
  }

  static List<LineTooltipItem> _getTooltipItems(List<LineBarSpot> items) {
    return List<LineTooltipItem>.generate(
      items.length,
      (int index) => LineTooltipItem(
        '${items[index].y}',
        AppFonts.bodyM.copyWith(color: Colors.black),
      ),
    );
  }

  static Color _getTooltipColor(_) => Colors.white;
}
