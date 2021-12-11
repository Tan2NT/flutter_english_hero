import 'package:english_hero/di/modules/api_modules.dart';
import 'package:english_hero/di/modules/components_module.dart';
import 'package:english_hero/di/modules/data_source_modules.dart';
import 'package:english_hero/di/modules/repository_modules.dart';
import 'package:english_hero/di/modules/use_case_modules.dart';
import 'package:english_hero/domain/usecase/user/authenticate_user.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class Injection {
  static Future<void> inject() async {
    await ApiModules().provides();
    await DataSourceModules().provides();
    await RepositoryModules().provides();
    await UseCaseModules().provides();
    await ComponentsModule().provides();
  }
}
