import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:navigation/navigation.dart';
import 'package:path_provider/path_provider.dart';

part 'user_folder_event.dart';

part 'user_folder_state.dart';

class UserFolderBloc extends Bloc<UserFolderEvent, UserFolderState> {
  final AppRouter _appRouter;

  UserFolderBloc({
    required AppRouter appRouter,
    required FolderModel folder,
  })  : _appRouter = appRouter,
        super(UserFolderState.initial(folder)) {
    on<InitEvent>(_onInit);
    on<OpenFolderEvent>(_onOpenFolderEvent);

    add(const InitEvent());
  }

  FutureOr<void> _onInit(
    InitEvent event,
    Emitter<UserFolderState> emit,
  ) async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String folderPath = '${appDocDir.path}/${state.folder.name}';
    final Directory folder = Directory(folderPath);
    emit(state.copyWith(numberFiles: folder.listSync().length));
  }

  FutureOr<void> _onOpenFolderEvent(
    OpenFolderEvent event,
    Emitter<UserFolderState> emit,
  ) async {
    await _appRouter.push(FoldersScanListRoute(folder: event.folder));
  }
}
