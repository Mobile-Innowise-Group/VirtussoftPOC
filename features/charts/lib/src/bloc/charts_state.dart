part of 'charts_bloc.dart';

final class ChartsState {
  final bool isLoading;
  final bool hasError;
  final List<ChartItem> items;

  const ChartsState.initial()
      : isLoading = true,
        hasError = false,
        items = const <ChartItem>[];

  const ChartsState({
    required this.isLoading,
    required this.hasError,
    required this.items,
  });

  ChartsState copyWith({
    bool? isLoading,
    bool? hasError,
    List<ChartItem>? items,
  }) {
    return ChartsState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      items: items ?? this.items,
    );
  }
}
