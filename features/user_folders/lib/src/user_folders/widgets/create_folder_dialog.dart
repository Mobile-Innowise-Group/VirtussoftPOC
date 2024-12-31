import 'package:core/core.dart';
import 'package:flutter/material.dart';

class CreateFolderDialog extends StatefulWidget {
  final Function(String) onCreate;

  const CreateFolderDialog({
    Key? key,
    required this.onCreate,
  }) : super(key: key);

  @override
  _CreateFolderDialogState createState() => _CreateFolderDialogState();
}

class _CreateFolderDialogState extends State<CreateFolderDialog> {
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
