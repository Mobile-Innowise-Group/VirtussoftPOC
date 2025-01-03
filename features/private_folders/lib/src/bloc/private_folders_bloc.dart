import 'dart:async';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/src/folders/folders.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:navigation/navigation.dart';

part 'private_folders_event.dart';

part 'private_folders_state.dart';

class PrivateFoldersBloc
    extends Bloc<PrivateFoldersEvent, PrivateFoldersState> {
  final AppEventNotifier _appEventNotifier;
  final GetPrivateFoldersUseCase _getPrivateFoldersUseCase;
  final ToggleFolderPrivacyUseCase _toggleFolderPrivacyUseCase;
  final CreatePrivateFolderUseCase _createPrivateFolderUseCase;
  final BiometricService _biometricService;
  final AppRouter _appRouter;

  PrivateFoldersBloc({
    required AppEventNotifier appEventNotifier,
    required GetPrivateFoldersUseCase getPrivateFoldersUseCase,
    required ToggleFolderPrivacyUseCase toggleFolderPrivacyUseCase,
    required CreatePrivateFolderUseCase createPrivateFolderUseCase,
    required BiometricService biometricService,
    required AppRouter appRouter,
  })  : _appEventNotifier = appEventNotifier,
        _getPrivateFoldersUseCase = getPrivateFoldersUseCase,
        _toggleFolderPrivacyUseCase = toggleFolderPrivacyUseCase,
        _createPrivateFolderUseCase = createPrivateFolderUseCase,
        _biometricService = biometricService,
        _appRouter = appRouter,
        super(PrivateFoldersState.initial()) {
    on<CreatePrivateFolderEvent>(_onCreatePrivateFolder);
    on<TogglePrivateFolderPrivacyEvent>(_onToggleFolderPrivacy);
    on<OpenPrivateFolderEvent>(_onOpenPrivateFolderEvent);
    on<InitEvent>(_onInit);

    add(const InitEvent());
  }

  FutureOr<void> _onInit(
    InitEvent event,
    Emitter<PrivateFoldersState> emit,
  ) async {
    if (!await _biometricService.authenticateWithBiometrics()) {
      emit(state.copyWith(isAuthenticated: false));
      return;
    }
    emit(
      state.copyWith(
        isLoading: true,
        isAuthenticated: true,
      ),
    );
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
    emit(state.copyWith(isLoading: true));
    try {
      final FolderModel folder = await _createPrivateFolderUseCase.execute(
        CreateFolderPayload(
          name: event.folderName,
          isPrivate: true,
        ),
      );
      final List<FolderModel> folders = List<FolderModel>.from(state.folders)
        ..add(folder);
      emit(state.copyWith(isLoading: false, folders: folders));
    } on FailedToCreateRemoteFolderException catch (_) {
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
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      _appEventNotifier.notify(
        SnackBarErrorNotification(message: e.toString()),
      );
    }
  }

  FutureOr<void> _onToggleFolderPrivacy(
    TogglePrivateFolderPrivacyEvent event,
    Emitter<PrivateFoldersState> emit,
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
      final List<FolderModel> privateFolders =
          await _getPrivateFoldersUseCase.execute(
        GetPrivateFoldersPayload(),
      );
      emit(state.copyWith(folders: privateFolders));
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


  FutureOr<void> _onOpenPrivateFolderEvent(
      OpenPrivateFolderEvent event,
      Emitter<PrivateFoldersState> emit,
      ) async {
    await _appRouter.push(FoldersScanListRoute(folder: event.folder));
  }
}
