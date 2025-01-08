import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'bloc/saving_scan_entry_bloc.dart';

class SavingScanEntryBottomSheetContent extends StatelessWidget {
  const SavingScanEntryBottomSheetContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavingScanEntryBloc, SavingScanEntryState>(
      builder: (BuildContext context, SavingScanEntryState state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Scanning successfully finished! Let`s save it!',
              style: AppFonts.headingH4,
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<CategoryModel>(
              value: state.selectedCategory,
              style: AppFonts.bodyM,
              items: state.categories.map((CategoryModel item) {
                return DropdownMenuItem<CategoryModel>(
                  value: item,
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/icons/tag.svg',
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.primary,
                          BlendMode.srcIn,
                        ),
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 16),
                      Text(item.name),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (CategoryModel? value) {
                if (value != null) {
                  context
                      .read<SavingScanEntryBloc>()
                      .add(ChangeScanCategory(category: value));
                }
              },
              decoration: InputDecoration(
                hintText: 'Select category of the scan',
                border: const OutlineInputBorder(),
                errorText: state.selectedCategoryFieldError,
              ),
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<FolderModel>(
              value: state.selectedFolder,
              style: AppFonts.bodyM,
              items: state.folders.map((FolderModel item) {
                return DropdownMenuItem<FolderModel>(
                  value: item,
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/icons/folder.svg',
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.primary,
                          BlendMode.srcIn,
                        ),
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 16),
                      Text(item.name),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (FolderModel? value) {
                if (value != null) {
                  context
                      .read<SavingScanEntryBloc>()
                      .add(ChangeSavingFolder(folder: value));
                }
              },
              decoration: InputDecoration(
                hintText: 'Select folder for saving scan',
                border: const OutlineInputBorder(),
                errorText: state.selectedFolderFieldError,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: () => context
                      .read<SavingScanEntryBloc>()
                      .add(const CancelSavingProcess()),
                  child: Text('common.cancel'.tr()),
                ),
                TextButton(
                  onPressed: () =>
                      context.read<SavingScanEntryBloc>().add(const SaveScan()),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: AppFonts.bodyM.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
