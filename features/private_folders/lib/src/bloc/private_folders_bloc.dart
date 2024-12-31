import 'dart:async';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:navigation/navigation.dart';

part 'private_folders_event.dart';

part 'private_folders_state.dart';

class PrivateFoldersBloc
    extends Bloc<PrivateFoldersEvent, PrivateFoldersState> {
  final AppEventNotifier _appEventNotifier;
  final GetPrivateFoldersUseCase _getPrivateFoldersUseCase;
  final CreatePrivateFolderUseCase _createPrivateFolderUseCase;
  final AppRouter _appRouter;

  PrivateFoldersBloc({
    required AppEventNotifier appEventNotifier,
    required GetPrivateFoldersUseCase getPrivateFoldersUseCase,
    required CreatePrivateFolderUseCase createPrivateFolderUseCase,
    required AppRouter appRouter,
  })  : _appEventNotifier = appEventNotifier,
        _getPrivateFoldersUseCase = getPrivateFoldersUseCase,
        _createPrivateFolderUseCase = createPrivateFolderUseCase,
        _appRouter = appRouter,
        super(PrivateFoldersState.initial()) {
    on<CreatePrivateFolderEvent>(_onCreatePrivateFolder);
    on<InitEvent>(_onInit);

    add(const InitEvent());
  }

  FutureOr<void> _onInit(
    InitEvent event,
    Emitter<PrivateFoldersState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final List<FolderModel> folders =
          await _getPrivateFoldersUseCase.execute(GetPrivateFoldersPayload());
      emit(
        state.copyWith(
          isLoading: false,
          folders: folders,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      _appEventNotifier.notify(
        SnackBarErrorNotification(message: e.toString()),
      );
    }
  }

  FutureOr<void> _onCreatePrivateFolder(
    CreatePrivateFolderEvent event,
    Emitter<PrivateFoldersState> emit,
  ) async {
    //   emit(state.copyWith(isLoading: true));
    //   try {
    //     final FolderModel folder = await _createFolderUseCase.execute(
    //       CreateFolderPayload(name: event.folderName),
    //     );
    //     final List<FolderModel> folders = List<FolderModel>.from(state.folders)
    //       ..add(folder);
    //     emit(state.copyWith(isLoading: false, folders: folders));
    //   } on FailedToCreateRemoteFolderException catch (_) {
    //     try {
    //       final List<FolderModel> folders =
    //           await _getPrivateFoldersUseCase.execute(GetPublicFoldersPayload());
    //       emit(
    //         state.copyWith(
    //           isLoading: false,
    //           folders: folders,
    //         ),
    //       );
    //     } catch (e) {
    //       emit(state.copyWith(isLoading: false));
    //       _appEventNotifier.notify(
    //         SnackBarErrorNotification(message: e.toString()),
    //       );
    //     }
    //   } catch (e) {
    //     emit(state.copyWith(isLoading: false));
    //     _appEventNotifier.notify(
    //       SnackBarErrorNotification(message: e.toString()),
    //     );
    //   }
  }
}
