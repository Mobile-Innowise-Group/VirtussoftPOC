import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'bloc/saving_scan_entry_bloc.dart';

class SavingScanEntryBottomSheetContent extends StatefulWidget {
  const SavingScanEntryBottomSheetContent({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _SavingScanEntryBottomSheetContentState();
}

class _SavingScanEntryBottomSheetContentState
    extends State<SavingScanEntryBottomSheetContent> {
  late final SavingScanEntryBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<SavingScanEntryBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetLayout(
      child: BlocBuilder<SavingScanEntryBloc, SavingScanEntryState>(
          bloc: _bloc,
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
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
                        _bloc.add(ChangeScanCategory(category: value));
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
                        _bloc.add(ChangeSavingFolder(folder: value));
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
                          _bloc.add(const SaveScan());
                        },
                        child: const Text('Save'),
                      ),
                      const SizedBox(width: 32),
                      ElevatedButton(
                        onPressed: () {
                          _bloc.add(const CancelSavingProcess());
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
