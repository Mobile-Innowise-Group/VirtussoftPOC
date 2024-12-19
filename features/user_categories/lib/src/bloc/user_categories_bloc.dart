import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_categories_event.dart';
part 'user_categories_state.dart';

class UserCategoriesBloc
    extends Bloc<UserCategoriesEvent, UserCategoriesState> {
  UserCategoriesBloc() : super(UserCategoriesInitial()) {
    on<UserCategoriesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
