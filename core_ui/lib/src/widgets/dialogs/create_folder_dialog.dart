import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class CreateFolderDialog extends StatefulWidget {
  final void Function(String folderName) optionYesCallback;
  final VoidCallback optionNoCallback;

  const CreateFolderDialog({
    required this.optionNoCallback,
    required this.optionYesCallback,
    super.key,
  });

  @override
  _CreateFolderDialogState createState() => _CreateFolderDialogState();
}

class _CreateFolderDialogState extends State<CreateFolderDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'folder.addNewFolder'.tr(),
        style: AppFonts.headingH3,
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(
              style: const TextStyle(color: Colors.black),
              controller: _controller,
              decoration: InputDecoration(hintText: 'folder.folderName'.tr()),
            )
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: widget.optionNoCallback,
          child: Text('common.cancel'.tr()),
        ),
        TextButton(
          onPressed: () {
            widget.optionYesCallback(_controller.text);
          },
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll<Color>(
              Theme.of(context).colorScheme.primary,
            ),
          ),
          child: Text(
            'common.create'.tr(),
            style: AppFonts.bodyM.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
