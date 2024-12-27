import 'dart:async';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/src/categories/categories.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:navigation/navigation.dart';

part 'user_categories_event.dart';

part 'user_categories_state.dart';

class UserCategoriesBloc
    extends Bloc<UserCategoriesEvent, UserCategoriesState> {
  final CreateCategoryUseCase _createCategoryUseCase;
  final GetUserCategoriesUseCase _getUserCategoriesUseCase;
  final DeleteCategoryUseCase _deleteCategoryUseCase;
  final AppEventNotifier _appEventNotifier;
  final AppRouter _appRouter;

  UserCategoriesBloc({
    required CreateCategoryUseCase createCategoryUseCase,
    required GetUserCategoriesUseCase getUserCategoriesUseCase,
    required DeleteCategoryUseCase deleteCategoryUseCase,
    required AppEventNotifier appEventNotifier,
    required AppRouter appRouter,
  })  : _createCategoryUseCase = createCategoryUseCase,
        _getUserCategoriesUseCase = getUserCategoriesUseCase,
        _deleteCategoryUseCase = deleteCategoryUseCase,
        _appEventNotifier = appEventNotifier,
        _appRouter = appRouter,
        super(UserCategoriesState.initial()) {
    on<CreateCategoryEvent>(_onCreateCategory);
    on<DeleteCategoryEvent>(_onDeleteCategory);
    on<ToggleExpandedEvent>(_onToggleExpanded);

    on<InitEvent>(_onInit);

    add(const InitEvent());
  }

  FutureOr<void> _onInit(
    InitEvent event,
    Emitter<UserCategoriesState> emit,
  ) async {
    try {
      final List<CategoryModel> categories =
          await _getUserCategoriesUseCase.execute(
        GetUserCategoriesPayload(),
      );
      emit(
        state.copyWith(
          isLoading: false,
          categories: categories,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      _appEventNotifier.notify(
        SnackBarErrorNotification(
          message: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> _onCreateCategory(
    CreateCategoryEvent event,
    Emitter<UserCategoriesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final CategoryModel category = await _createCategoryUseCase.execute(
        CreateCategoryPayload(name: event.categoryName),
      );
      final List<CategoryModel> categories =
          List<CategoryModel>.from(state.categories)..add(category);
      emit(
        state.copyWith(
          isLoading: false,
          categories: categories,
        ),
      );
    } on FailedToCreateRemoteCategoryException catch (_) {
      try {
        final List<CategoryModel> categories =
            await _getUserCategoriesUseCase.execute(GetUserCategoriesPayload());
        emit(
          state.copyWith(
            isLoading: false,
            categories: categories,
          ),
        );
      } catch (e) {
        emit(state.copyWith(isLoading: false));
        _appEventNotifier.notify(
          SnackBarErrorNotification(
            message: e.toString(),
          ),
        );
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

  FutureOr<void> _onDeleteCategory(
    DeleteCategoryEvent event,
    Emitter<UserCategoriesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final bool isDeleted = await _deleteCategoryUseCase.execute(
        DeleteCategoryPayload(
          category: event.category,
        ),
      );
      if (isDeleted) {
        final List<CategoryModel> categories =
            List<CategoryModel>.from(state.categories)
              ..removeWhere(
                  (CategoryModel category) => category.id == event.category.id);
        emit(
          state.copyWith(
            isLoading: false,
            categories: categories,
          ),
        );
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
    Emitter<UserCategoriesState> emit,
  ) async {
    emit(state.copyWith(isExpanded: !state.isExpanded));
  }
}
