import 'package:flutter/material.dart';

class CreateTagDialog extends StatefulWidget {
  final Function(String) onCreate;

  const CreateTagDialog({Key? key, required this.onCreate}) : super(key: key);

  @override
  _CreateTagDialogState createState() => _CreateTagDialogState();
}

class _CreateTagDialogState extends State<CreateTagDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create New Tag'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(hintText: 'Tag Name'),
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
