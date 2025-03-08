import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/charts_bloc.dart';
import 'charts_content.dart';

@RoutePage()
class ChartsScreen extends StatelessWidget {
  const ChartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChartsBloc>(
      create: (_) => ChartsBloc(
        appEventNotifier: appLocator<AppEventNotifier>(),
        getAllUserReceiptsUseCase: appLocator<GetAllUserReceiptsUseCase>(),
      )..add(const LoadData()),
      child: const ChartsContent(),
    );
  }
}
