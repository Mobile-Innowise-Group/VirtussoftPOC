import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';

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

      receipts.sort((ReceiptModel a, ReceiptModel b) => a.receiptDate.compareTo(b.receiptDate));

      final List<ChartItem> items = List<ChartItem>.generate(
        receipts.length,
        (int index) {
          final ReceiptModel receipt = receipts[index];
          return ChartItem(
            date: DateTime.parse(receipt.receiptDate),
            value: double.parse(receipt.totalAmount),
          );
        },
      );

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
}
