import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:navigation/navigation.dart';

part 'user_folders_event.dart';

part 'user_folders_state.dart';

class UserFoldersBloc extends Bloc<UserFoldersEvent, UserFoldersState> {
  final AppEventNotifier _appEventNotifier;
  final AppRouter _appRouter;

  UserFoldersBloc({
    required AppEventNotifier appEventNotifier,
    required AppRouter appRouter,
  })  : _appEventNotifier = appEventNotifier,
        _appRouter = appRouter,
        super(UserFoldersState.initial()) {
    on<UserFoldersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
