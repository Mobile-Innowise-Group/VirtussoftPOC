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
      title: const Text('Create New Folder'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(hintText: 'Folder Name'),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onCreate(_controller.text);
            Navigator.of(context).pop();
          },
          child: const Text('Create'),
        ),
      ],
    );
  }
}
