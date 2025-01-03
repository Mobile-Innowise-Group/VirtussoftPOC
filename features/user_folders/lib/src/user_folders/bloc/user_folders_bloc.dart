import 'dart:async';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/src/folders/folders.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:navigation/navigation.dart';

part 'user_folders_event.dart';

part 'user_folders_state.dart';

class UserFoldersBloc extends Bloc<UserFoldersEvent, UserFoldersState> {
  final AppEventNotifier _appEventNotifier;
  final CreateFolderUseCase _createFolderUseCase;
  final DeleteFolderUseCase _deleteFolderUseCase;
  final GetPublicFoldersUseCase _getFoldersUseCase;
  final ToggleFolderPrivacyUseCase _toggleFolderPrivacyUseCase;
  final AppRouter _appRouter;

  UserFoldersBloc({
    required AppEventNotifier appEventNotifier,
    required CreateFolderUseCase createFolderUseCase,
    required DeleteFolderUseCase deleteFolderUseCase,
    required GetPublicFoldersUseCase getFoldersUseCase,
    required ToggleFolderPrivacyUseCase toggleFolderPrivacyUseCase,
    required AppRouter appRouter,
  })  : _appEventNotifier = appEventNotifier,
        _createFolderUseCase = createFolderUseCase,
        _deleteFolderUseCase = deleteFolderUseCase,
        _getFoldersUseCase = getFoldersUseCase,
        _toggleFolderPrivacyUseCase = toggleFolderPrivacyUseCase,
        _appRouter = appRouter,
        super(UserFoldersState.initial()) {
    on<CreateFolderEvent>(_onCreateFolder);
    on<DeleteFolderEvent>(_onDeleteFolder);
    on<ToggleExpandedEvent>(_onToggleExpanded);
    on<ToggleFolderPrivacyEvent>(_onToggleFolderPrivacy);
    on<OpenFolderEvent>(_onOpenFolderEvent);
    on<InitEvent>(_onInit);

    add(const InitEvent());
  }

  FutureOr<void> _onInit(
    InitEvent event,
    Emitter<UserFoldersState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final List<FolderModel> folders =
          await _getFoldersUseCase.execute(GetPublicFoldersPayload());
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

  FutureOr<void> _onCreateFolder(
    CreateFolderEvent event,
    Emitter<UserFoldersState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final FolderModel folder = await _createFolderUseCase.execute(
        CreateFolderPayload(name: event.folderName),
      );
      final List<FolderModel> folders = List<FolderModel>.from(state.folders)
        ..add(folder);
      emit(state.copyWith(isLoading: false, folders: folders));
    } on FailedToCreateRemoteFolderException catch (_) {
      try {
        final List<FolderModel> folders =
            await _getFoldersUseCase.execute(GetPublicFoldersPayload());
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
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      _appEventNotifier.notify(
        SnackBarErrorNotification(message: e.toString()),
      );
    }
  }

  FutureOr<void> _onDeleteFolder(
    DeleteFolderEvent event,
    Emitter<UserFoldersState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final bool isDeleted = await _deleteFolderUseCase.execute(
        DeleteFolderPayload(folder: event.folder),
      );
      if (isDeleted) {
        final List<FolderModel> folders = List<FolderModel>.from(state.folders)
          ..removeWhere((FolderModel folder) => folder.id == event.folder.id);
        emit(state.copyWith(isLoading: false, folders: folders));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      _appEventNotifier.notify(
        SnackBarErrorNotification(
          message: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> _onToggleExpanded(
    ToggleExpandedEvent event,
    Emitter<UserFoldersState> emit,
  ) async {
    emit(state.copyWith(isExpanded: !state.isExpanded));
  }

  FutureOr<void> _onToggleFolderPrivacy(
    ToggleFolderPrivacyEvent event,
    Emitter<UserFoldersState> emit,
  ) async {
    try {
      await _appRouter.maybePop();
      emit(
        state.copyWith(isLoading: true),
      );
      await _toggleFolderPrivacyUseCase.execute(
        ToggleFolderPrivacyPayload(
          folder: event.folder,
        ),
      );
      final List<FolderModel> folders = List<FolderModel>.from(state.folders)
        ..removeWhere((FolderModel folder) => folder.id == event.folder.id);
      emit(
        state.copyWith(folders: folders),
      );
    } on FailedToEditRemoteFolderException catch (_) {
      final List<FolderModel> folders =
          await _getFoldersUseCase.execute(GetPublicFoldersPayload());
      emit(state.copyWith(folders: folders));
    } catch (e) {
      _appEventNotifier.notify(
        SnackBarErrorNotification(
          message: e.toString(),
        ),
      );
    } finally {
      emit(
        state.copyWith(isLoading: false),
      );
    }
  }

  FutureOr<void> _onOpenFolderEvent(
    OpenFolderEvent event,
    Emitter<UserFoldersState> emit,
  ) async {
    await _appRouter.push(FoldersScanListRoute(folder: event.folder));
  }
}
