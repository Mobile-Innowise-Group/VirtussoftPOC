part of 'charts_bloc.dart';

sealed class ChartsEvent {
  const ChartsEvent();
}

final class Initialize extends ChartsEvent {
  const Initialize();
}
