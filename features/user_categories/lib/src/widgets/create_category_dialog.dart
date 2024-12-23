import 'package:flutter/material.dart';

class CreateCategoryDialog extends StatefulWidget {
  final Function(String) onCreate;

  const CreateCategoryDialog({
    Key? key,
    required this.onCreate,
  }) : super(key: key);

  @override
  _CreateCategoryDialogState createState() => _CreateCategoryDialogState();
}

class _CreateCategoryDialogState extends State<CreateCategoryDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create New Category'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(hintText: 'Category Name'),
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
