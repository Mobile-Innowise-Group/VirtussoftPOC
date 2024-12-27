part of 'home_bloc.dart';

@immutable
class HomeState {
  final bool isLoading;

  const HomeState({
    required this.isLoading,
  });

  factory HomeState.initial() {
    return const HomeState(
      isLoading: false,
    );
  }

  HomeState copyWith({
    bool? isLoading,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
