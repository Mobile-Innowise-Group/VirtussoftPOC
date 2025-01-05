import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../bloc/categorized_documents_list_bloc.dart';

class CategorizedDocumentListContent extends StatelessWidget {
  const CategorizedDocumentListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategorizedDocumentsListBloc,
        CategorizedDocumentsListState>(
      builder: (BuildContext context, CategorizedDocumentsListState state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return const Center(child: Placeholder());
      },
    );
  }
}
