import '../../core.dart';

class AppBlocObserver extends BlocObserver {
  @override
  Future<void> onEvent(Bloc<dynamic, dynamic> bloc, Object? event) async {
    super.onEvent(bloc, event);
    AppLogger().info('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    AppLogger().info(
        'onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    AppLogger().error('onError -- bloc: ${bloc.runtimeType}, error: $error');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    AppLogger().info('onChange -- bloc: ${bloc.runtimeType}, change: $change');
  }
}
