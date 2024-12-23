import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'bloc/user_folders_bloc.dart';

@RoutePage()
class UserFoldersScreen extends StatelessWidget implements AutoRouteWrapper {
  const UserFoldersScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<UserFoldersBloc>(
      create: (_) => UserFoldersBloc(
        appEventNotifier: appLocator<AppEventNotifier>(),
        appRouter: appLocator<AppRouter>(),
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Tags'),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<UserFoldersBloc, UserFoldersState>(
        builder: (BuildContext context, UserFoldersState state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const SizedBox();
            // return Wrap(
            //   spacing: 8.0,
            //   children: state.folders.map((tag) {
            //     return Chip(
            //       label: Text(tag.name),
            //       onDeleted: () {
            //         context.read<UserFoldersBloc>().add(DeleteTagEvent(tag));
            //       },
            //     );
            //   }).toList(),
            // );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return const SizedBox();
            // return CreateTagDialog(
            //   onCreate: (String tagName) {
            //     context.read<UserTagsBloc>().add(CreateTagEvent(tagName: tagName));
            //   },
            // );
          },
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
