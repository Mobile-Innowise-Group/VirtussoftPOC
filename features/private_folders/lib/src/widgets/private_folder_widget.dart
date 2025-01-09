import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_folders/src/user_folder/bloc/user_folder_bloc.dart';

import '../bloc/private_folders_bloc.dart';

class PrivateFolderWidget extends StatelessWidget {
  const PrivateFolderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFolderBloc, UserFolderState>(
      builder: (BuildContext context, UserFolderState state) {
        return InkWell(
          onTap: () => context
              .read<PrivateFoldersBloc>()
              .add(OpenPrivateFolderEvent(folder: state.folder)),
          onLongPress: () {
            AppBottomSheet.show(
              context: context,
              child: ListTile(
                onTap: () => context
                    .read<PrivateFoldersBloc>()
                    .add(TogglePrivateFolderPrivacyEvent(state.folder)),
                title: Text(
                  'folder.makeFolderPublic'.tr(),
                ),
                leading: Icon(
                  Icons.lock,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            );
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 72,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/icons/folder.svg',
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                  width: 40,
                  height: 40,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        state.folder.name,
                        style: AppFonts.headingH5,
                      ),
                      Text(
                        '${state.numberFiles} files',
                        style: AppFonts.bodyS.copyWith(
                          color: AppColors.of(context).textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
