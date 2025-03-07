import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/charts_bloc.dart';
import '../widgets/receipt_chart.dart';

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
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Center(
              child: SizedBox(
                height: 400,
                child: ReceiptChart(
                  data: state.items,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
