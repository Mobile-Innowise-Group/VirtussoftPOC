part of 'saving_scan_entry_bloc.dart';

abstract class SavingScanEntryEvent {
  const SavingScanEntryEvent();
}

class InitEvent extends SavingScanEntryEvent {
  const InitEvent();
}

class ChangeSavingFolder extends SavingScanEntryEvent {
  final FolderModel folder;

  const ChangeSavingFolder({
    required this.folder,
  });
}

class ChangeScanCategory extends SavingScanEntryEvent {
  final CategoryModel category;

  const ChangeScanCategory({
    required this.category,
  });
}

class CancelSavingProcess extends SavingScanEntryEvent {
  const CancelSavingProcess();
}

class SaveScan extends SavingScanEntryEvent {
  const SaveScan();
}
