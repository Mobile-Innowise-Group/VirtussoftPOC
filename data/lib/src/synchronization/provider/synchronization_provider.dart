abstract class SynchronizationProvider {
  Future<bool> isFirstLaunch();

  Future<void> setFirstLaunch();
}
