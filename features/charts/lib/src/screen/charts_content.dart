import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/charts_bloc.dart';
import '../models/chart_item.dart';
import '../widgets/receipt_dot_chart.dart';

class ChartsContent extends StatelessWidget {
  const ChartsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Charts',
          style: AppFonts.headingH4,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.PADDING_16),
        child: BlocBuilder<ChartsBloc, ChartsState>(
          builder: (BuildContext context, ChartsState state) {
            return RefreshIndicator(
              onRefresh: () async {
                final ChartsBloc bloc = context.read<ChartsBloc>();
                bloc.add(const LoadData());
              },
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: <Widget>[
                  SliverFillRemaining(
                    child: Builder(
                      builder: (BuildContext context) {
                        if (state.isLoading) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        if (state.hasError) {
                          return Center(
                            child: Text(
                              'Error while fetching receipts',
                              style: AppFonts.headingH5.copyWith(color: Colors.black),
                            ),
                          );
                        }

                        if (state.items.isEmpty) {
                          return Center(
                            child: Text(
                              'No data to display',
                              style: AppFonts.headingH5.copyWith(color: Colors.black),
                            ),
                          );
                        }

                        return Column(
                          children: <Widget>[
                            Text(
                              'Your spending dynamic',
                              style: AppFonts.headingH5.copyWith(color: Colors.black),
                            ),
                            const SizedBox(height: AppDimens.PADDING_16),
                            ReceiptDotChart(
                              data: <ChartItem>[
                                ChartItem(date: DateTime(2023, 7), value: 50),
                                ChartItem(date: DateTime(2023, 8), value: 131),
                                ChartItem(date: DateTime(2023, 9), value: 70),
                                ChartItem(date: DateTime(2023, 12), value: 120),
                                ChartItem(date: DateTime(2024, 2), value: 120),
                                ChartItem(date: DateTime(2024, 3), value: 10),
                                ChartItem(date: DateTime(2024, 4), value: 35),
                                ChartItem(date: DateTime(2024, 6), value: 62),
                                ChartItem(date: DateTime(2024, 7), value: 112),
                                ChartItem(date: DateTime(2025, 3), value: 58),
                                ChartItem(date: DateTime(2028, 7), value: 158),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
