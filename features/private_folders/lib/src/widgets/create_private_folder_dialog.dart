import 'package:core/core.dart';
import 'package:flutter/material.dart';

class CreatePrivateFolderDialog extends StatefulWidget {
  final Function(String) onCreate;

  const CreatePrivateFolderDialog({
    Key? key,
    required this.onCreate,
  }) : super(key: key);

  @override
  _CreatePrivateFolderDialogState createState() =>
      _CreatePrivateFolderDialogState();
}

class _CreatePrivateFolderDialogState extends State<CreatePrivateFolderDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('folder.createFolder'.tr()),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: 'folder.folderName'.tr()),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('common.cancel'.tr()),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onCreate(_controller.text);
            Navigator.of(context).pop();
          },
          child: Text('common.create'.tr()),
        ),
      ],
    );
  }
}
