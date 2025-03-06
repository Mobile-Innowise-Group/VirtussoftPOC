import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ItemsTableWidget extends StatelessWidget {
  final List<LineItemModel> items;

  const ItemsTableWidget({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Items purchased',
            style: AppFonts.headingH1,
          ),
        ),
        const SizedBox(height: AppDimens.SIZE_12),
        DataTable(
          columnSpacing: 20.0,
          headingRowColor: WidgetStateProperty.all(Theme.of(context).colorScheme.secondary),
          columns: <DataColumn>[
            DataColumn(
              label: Text('Description', style: AppFonts.actionM),
            ),
            DataColumn(
              label: Text('Quantity', style: AppFonts.actionM),
            ),
            DataColumn(
              label: Text('Unit Price', style: AppFonts.actionM),
            ),
          ],
          rows: items
              .map<DataRow>(
                (LineItemModel item) => DataRow(
                  cells: <DataCell>[
                    DataCell(
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 200),
                        child: Text(
                          item.description,
                          style: AppFonts.actionS,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        item.quantity,
                        style: AppFonts.actionS,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                    DataCell(
                      Text(
                        item.totalPrice,
                        style: AppFonts.actionS,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
          border: TableBorder.all(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: const BorderRadius.all(Radius.circular(AppDimens.BORDER_RADIUS_12)),
          ),
        ),
      ],
    );
  }
}
