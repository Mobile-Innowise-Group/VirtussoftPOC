import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

import '../models/chart_item.dart';

part 'charts_event.dart';
part 'charts_state.dart';

class ChartsBloc extends Bloc<ChartsEvent, ChartsState> {
  final AppEventNotifier _appEventNotifier;
  final GetAllUserReceiptsUseCase _getAllUserReceiptsUseCase;

  ChartsBloc({
    required AppEventNotifier appEventNotifier,
    required GetAllUserReceiptsUseCase getAllUserReceiptsUseCase,
  })  : _appEventNotifier = appEventNotifier,
        _getAllUserReceiptsUseCase = getAllUserReceiptsUseCase,
        super(const ChartsState.initial()) {
    on<LoadData>(_onLoadData);
  }

  Future<void> _onLoadData(
    LoadData event,
    Emitter<ChartsState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true),
    );

    try {
      final List<ReceiptModel> receipts = await _getAllUserReceiptsUseCase.execute(
        const GetAllUserReceiptsPayload(),
      );

      final List<ChartItem> items = _groupReceiptsByMonth(receipts);

      emit(
        state.copyWith(
          items: items,
          isLoading: false,
        ),
      );
    } catch (e) {
      _appEventNotifier.notify(
        SnackBarErrorNotification(message: e.toString()),
      );

      emit(
        state.copyWith(
          isLoading: false,
          hasError: true,
        ),
      );
    }
  }

  List<ChartItem> _groupReceiptsByMonth(List<ReceiptModel> receipts) {
    final Map<String, double> monthlyTotals = <String, double>{};

    DateTime? earliestDate;
    DateTime? latestDate;

    for (final ReceiptModel receipt in receipts) {
      try {
        final DateTime date = DateTime.parse(receipt.receiptDate);
        final String monthKey = '${date.year}-${date.month}';

        final double amount = double.tryParse(receipt.totalAmount) ?? 0.0;

        if (earliestDate == null || date.isBefore(earliestDate)) {
          earliestDate = date;
        }
        if (latestDate == null || date.isAfter(latestDate)) {
          latestDate = date;
        }

        monthlyTotals[monthKey] = (monthlyTotals[monthKey] ?? 0.0) + amount;
      } catch (e) {
        debugPrint('Error parsing receipt date: ${receipt.receiptDate}, error: $e');
      }
    }

    if (earliestDate == null || latestDate == null) {
      return [];
    }

    final List<ChartItem> chartItems = <ChartItem>[];

    DateTime currentMonth = DateTime(earliestDate.year, earliestDate.month);
    final DateTime endMonth = DateTime(latestDate.year, latestDate.month);

    while (currentMonth.isBefore(endMonth) || currentMonth.isAtSameMomentAs(endMonth)) {
      final String monthKey = '${currentMonth.year}-${currentMonth.month}';

      final double total = monthlyTotals[monthKey] ?? 0.0;

      chartItems.add(ChartItem(
        date: DateTime(currentMonth.year, currentMonth.month),
        value: total,
      ));

      currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
    }

    chartItems.sort((ChartItem a, ChartItem b) => a.date.compareTo(b.date));

    return chartItems;
  }
}
