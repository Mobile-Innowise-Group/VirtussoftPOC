import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'bloc/categorized_documents_list_bloc.dart';
import 'widget/categorized_document_list_content.dart';

@RoutePage()
class CategorizedDocumentListScreen extends StatelessWidget
    implements AutoRouteWrapper {
  final CategoryModel category;

  const CategorizedDocumentListScreen({
    required this.category,
    Key? key,
  }) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CategorizedDocumentsListBloc>(
      create: (_) => CategorizedDocumentsListBloc(
        getScanEntriesByCategoryUseCase:
            appLocator.get<GetScanEntriesByCategoryUseCase>(),
        appEventNotifier: appLocator.get<AppEventNotifier>(),
        biometricService: appLocator.get<BiometricService>(),
        category: category,
        appRouter: appLocator.get<AppRouter>(),
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.name,
          style: AppFonts.headingH4,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.lock,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              context.read<CategorizedDocumentsListBloc>().add(
                    const ShowPrivateFilesEvent(),
                  );
            },
          )
        ],
      ),
      body: const CategorizedDocumentListContent(),
    );
  }
}
