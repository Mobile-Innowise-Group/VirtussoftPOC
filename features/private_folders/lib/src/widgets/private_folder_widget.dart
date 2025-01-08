import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/private_folders_bloc.dart';

class PrivateFolderWidget extends StatelessWidget {
  final FolderModel folder;

  const PrivateFolderWidget({
    super.key,
    required this.folder,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context
          .read<PrivateFoldersBloc>()
          .add(OpenPrivateFolderEvent(folder: folder)),
      onLongPress: () {
        AppBottomSheet.show(
          context: context,
          child: ListTile(
            onTap: () => context
                .read<PrivateFoldersBloc>()
                .add(TogglePrivateFolderPrivacyEvent(folder)),
            title: Text(
              'folder.makeFolderPublic'.tr(),
            ),
            leading: const Icon(Icons.lock),
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
                    folder.name,
                    style: AppFonts.headingH5,
                  ),
                  Text(
                    '${0} files',
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
  }
}
