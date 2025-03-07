part of 'charts_bloc.dart';

final class ChartsState {
  final bool isLoading;
  final List<ChartItem> items;

  const ChartsState.initial()
      : isLoading = true,
        items = const <ChartItem>[];

  const ChartsState({
    required this.isLoading,
    required this.items,
  });

  ChartsState copyWith({
    bool? isLoading,
    List<ChartItem>? items,
  }) {
    return ChartsState(
      isLoading: isLoading ?? this.isLoading,
      items: items ?? this.items,
    );
  }
}
