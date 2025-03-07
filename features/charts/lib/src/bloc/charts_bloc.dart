import 'dart:math';

import 'package:core/core.dart';

import '../models/chart_item.dart';

part 'charts_event.dart';
part 'charts_state.dart';

class ChartsBloc extends Bloc<ChartsEvent, ChartsState> {
  ChartsBloc() : super(const ChartsState.initial()) {
    on<Initialize>(_onInitialize);
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<ChartsState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: false,
        items: _generateMockData(10),
      ),
    );
  }

  List<ChartItem> _generateMockData(int days) {
    final Random random = Random();

    return List<ChartItem>.generate(
      days,
      (int index) {
        return ChartItem(
          date: DateTime.now().subtract(Duration(days: index)),
          value: (random.nextDouble() * 100) + 10,
        );
      },
    ).reversed.toList();
  }
}
