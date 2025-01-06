import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'bloc/saving_scan_entry_bloc.dart';

class SavingScanEntryBottomSheetContent extends StatelessWidget {
  const SavingScanEntryBottomSheetContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SavingScanEntryBloc bloc = BlocProvider.of<SavingScanEntryBloc>(context);

    return BlocBuilder<SavingScanEntryBloc, SavingScanEntryState>(
      bloc: bloc,
      builder: (BuildContext context, SavingScanEntryState state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Scanning successfully finished! Let`s save it!',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<CategoryModel>(
                value: state.selectedCategory,
                items: state.categories.map((CategoryModel item) {
                  return DropdownMenuItem<CategoryModel>(
                    value: item,
                    child: Text(item.name),
                  );
                }).toList(),
                onChanged: (CategoryModel? value) {
                  if (value != null) {
                    bloc.add(ChangeScanCategory(category: value));
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Select category of the scan',
                  border: const OutlineInputBorder(),
                  errorText: state.selectedCategoryFieldError,
                ),
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<FolderModel>(
                value: state.selectedFolder,
                items: state.folders.map((FolderModel item) {
                  return DropdownMenuItem<FolderModel>(
                    value: item,
                    child: Text(item.name),
                  );
                }).toList(),
                onChanged: (FolderModel? value) {
                  if (value != null) {
                    bloc.add(ChangeSavingFolder(folder: value));
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Select folder for saving scan',
                  border: const OutlineInputBorder(),
                  errorText: state.selectedFolderFieldError,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      bloc.add(const SaveScan());
                    },
                    child: const Text('Save'),
                  ),
                  const SizedBox(width: 32),
                  ElevatedButton(
                    onPressed: () {
                      bloc.add(const CancelSavingProcess());
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
