import '../../base/define/storage/types/secure_storage.dart';
import '../di_module.dart';

class ComponentsModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerSingleton(SecureStorage());
  }
}
