import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class FolderCard extends StatelessWidget {
  final FolderModel folder;

  const FolderCard({Key? key, required this.folder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(folder.name),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            // Handle folder deletion
          },
        ),
      ),
    );
  }
}
