part of 'home_bloc.dart';

@immutable
class HomeState {
  final bool isLoading;
  final bool isInternetConnected;

  const HomeState({
    required this.isLoading,
    required this.isInternetConnected,
  });

  factory HomeState.initial() {
    return const HomeState(
      isLoading: false,
      isInternetConnected: true,
    );
  }

  HomeState copyWith({
    bool? isLoading,
    bool? isInternetConnected,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      isInternetConnected: isInternetConnected ?? this.isInternetConnected,
    );
  }
}
