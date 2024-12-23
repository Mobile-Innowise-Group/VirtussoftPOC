import 'package:core/core.dart';
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
      title: Text('category.createCategory'.tr()),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: 'category.categoryName'.tr()),
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
