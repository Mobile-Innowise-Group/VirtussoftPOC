import 'package:core/core.dart';
import 'package:navigation/navigation.dart';

part 'doc_scanner_event.dart';

part 'doc_scanner_state.dart';

class DocScannerBloc extends Bloc<DocScannerEvent, DocScannerState> {
  final AppRouter _appRouter;

  DocScannerBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(const DocScannerState.initial());
}
