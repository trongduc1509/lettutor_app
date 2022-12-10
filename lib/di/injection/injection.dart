import 'package:lettutor_app/di/module/components_module.dart';
import 'package:lettutor_app/di/module/repositories_module.dart';

class Injection {
  static Future inject() async {
    await ComponentsModule().provides();
    await RepositoriesModule().provides();
  }
}
