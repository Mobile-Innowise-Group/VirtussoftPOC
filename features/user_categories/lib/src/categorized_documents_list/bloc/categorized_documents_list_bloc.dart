import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'categorized_documents_list_event.dart';
part 'categorized_documents_list_state.dart';

class CategorizedDocumentsListBloc extends Bloc<CategorizedDocumentsListEvent, CategorizedDocumentsListState> {
  CategorizedDocumentsListBloc() : super(CategorizedDocumentsListInitial()) {
    on<CategorizedDocumentsListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
