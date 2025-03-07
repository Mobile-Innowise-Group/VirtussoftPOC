import 'package:core/core.dart';
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
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'scanResults.itemsPurchased'.tr(),
            style: AppFonts.headingH2,
          ),
        ),
        const SizedBox(height: AppDimens.SIZE_12),
        DataTable(
          columnSpacing: AppDimens.PADDING_20,
          clipBehavior: Clip.antiAlias,
          headingTextStyle: AppFonts.bodyM.copyWith(color: Colors.black),
          dataTextStyle: AppFonts.bodyM.copyWith(color: Colors.black),
          headingRowColor: WidgetStateProperty.all(colors.secondary),
          border: TableBorder.all(
            color: colors.secondary,
            borderRadius: const BorderRadius.all(Radius.circular(AppDimens.BORDER_RADIUS_12)),
          ),
          columns: <DataColumn>[
            DataColumn(
              label: Text('scanResults.description'.tr()),
            ),
            DataColumn(
              label: Text('scanResults.quantity'.tr()),
            ),
            DataColumn(
              label: Text('scanResults.unitPrice'.tr()),
            ),
          ],
          rows: items
              .map<DataRow>(
                (LineItemModel item) => DataRow(
                  cells: <DataCell>[
                    DataCell(
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 150),
                        child: Text(
                          item.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          softWrap: true,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        item.quantity,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                    DataCell(
                      Text(
                        item.unitPrice,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
