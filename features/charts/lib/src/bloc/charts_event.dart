part of 'charts_bloc.dart';

sealed class ChartsEvent {
  const ChartsEvent();
}

final class LoadData extends ChartsEvent {
  const LoadData();
}
