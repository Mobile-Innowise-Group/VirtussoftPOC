import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'saving_scan_entry_event.dart';
part 'saving_scan_entry_state.dart';

class SavingScanEntryBloc extends Bloc<SavingScanEntryEvent, SavingScanEntryState> {
  final AppRouter _appRouter;
  final GetAllFoldersUseCase _getAllFoldersUseCase;
  final GetUserCategoriesUseCase _getUserCategoriesUseCase;
  final CreateScanEntryUseCase _createScanEntryUseCase;
  final AppEventNotifier _appEventNotifier;

  String _scanPath;

  SavingScanEntryBloc({
    required AppRouter appRouter,
    required GetAllFoldersUseCase getAllFoldersUseCase,
    required GetUserCategoriesUseCase getUserCategoriesUseCase,
    required CreateScanEntryUseCase createScanEntryUseCase,
    required AppEventNotifier appEventNotifier,
    required String scanPath,
  })  : _appRouter = appRouter,
        _getAllFoldersUseCase = getAllFoldersUseCase,
        _getUserCategoriesUseCase = getUserCategoriesUseCase,
        _createScanEntryUseCase = createScanEntryUseCase,
        _appEventNotifier = appEventNotifier,
        _scanPath = scanPath,
        super(const SavingScanEntryState.initial()) {
    on<InitEvent>(_onInitEvent);
    on<ChangeSavingFolder>(_onChangeSavingFolder);
    on<ChangeScanCategory>(_onChangeScanCategory);
    on<SaveScan>(_onSaveScan);
    on<CancelSavingProcess>(_onCancelSavingProcess);

    add(const InitEvent());
  }

  Future<void> _onInitEvent(
    InitEvent event,
    Emitter<SavingScanEntryState> emit,
  ) async {
    try {
      final List<FolderModel> folders = await _getAllFoldersUseCase.execute(GetAllFoldersPayload());
      final List<CategoryModel> categories =
          await _getUserCategoriesUseCase.execute(GetUserCategoriesPayload());

      emit(
        state.copyWith(
          isLoading: false,
          folders: folders,
          categories: categories,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
      _appEventNotifier.notify(
        SnackBarErrorNotification(
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _onChangeSavingFolder(
    ChangeSavingFolder event,
    Emitter<SavingScanEntryState> emit,
  ) async {
    emit(
      state.copyWith(selectedFolder: event.folder),
    );
  }

  Future<void> _onChangeScanCategory(
    ChangeScanCategory event,
    Emitter<SavingScanEntryState> emit,
  ) async {
    emit(
      state.copyWith(selectedCategory: event.category),
    );
  }

  Future<void> _onSaveScan(
    SaveScan event,
    Emitter<SavingScanEntryState> emit,
  ) async {
    final FolderModel? folder = state.selectedFolder;
    final String? categoryId = state.selectedCategory?.id;

    if (folder != null && categoryId != null) {
      try {
        emit(
          state.copyWith(isLoading: true),
        );

        final String newScanPath = await PdfService.transferFile(
          currentFilePath: _scanPath,
          newFolderName: folder.name,
        );

        _scanPath = newScanPath;

        await _createScanEntryUseCase.execute(
          CreateScanEntryPayload(
            scanLocalPath: newScanPath,
            folderId: folder.id,
            categoryId: categoryId,
          ),
        );

        await _appRouter.replace(const UserDataRoute());
        emit(
          const SavingScanEntryState.initial(isLoading: false),
        );
      } catch (e) {
        emit(state.copyWith(isLoading: false));

        // TODO(Karatysh): check is notification showing above bottomSheet
        _appEventNotifier.notify(
          SnackBarErrorNotification(
            message: e.toString(),
          ),
        );
      }
    } else {
      emit(
        state.copyWith(
          selectedFolderFieldError: folder == null ? 'Folder field is required' : null,
          selectedCategoryFieldError: categoryId == null ? 'Category field is required' : null,
        ),
      );
    }
  }

  Future<void> _onCancelSavingProcess(
    CancelSavingProcess event,
    Emitter<SavingScanEntryState> emit,
  ) async {
    await _appRouter.maybePop();
    emit(const SavingScanEntryState.initial());
  }
}
