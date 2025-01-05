part of 'categorized_documents_list_bloc.dart';

@immutable
sealed class CategorizedDocumentsListEvent {
  const CategorizedDocumentsListEvent();
}

class InitEvent extends CategorizedDocumentsListEvent {
  const InitEvent();
}
