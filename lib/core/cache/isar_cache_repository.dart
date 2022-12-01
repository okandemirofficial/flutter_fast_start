import 'package:flutter_fast_start/core/cache/abstract/cache_repository.dart';
import 'package:flutter_fast_start/core/cache/app_settings_model.dart';
import 'package:isar/isar.dart';
// ignore_for_file: flutter_style_todos

///Isar repository for caching
class IsarCacheRepository extends CacheRepository {
  IsarCacheRepository._init(this._isar);

  final Isar _isar;

  //TODO: Add here if you plan to add any model for caching

  // I decided to open all schemas at once. It should be changed if it's wrong
  static final List<CollectionSchema<dynamic>> _schemas = [
    AppSettingsModelSchema,
  ];

  ///Async initializer for isar
  static Future<IsarCacheRepository> initAsync() async {
    final isar = await Isar.open(_schemas);
    return IsarCacheRepository._init(isar);
  }

  @override
  AppSettingsModel getAppsettings() {
    //If it's null, creating with default values
    var appSettings = _isar.appSettingsModels.getSync(1);
    if (appSettings == null) {
      appSettings = initAppSettings(); // Comes from base class
      putAppSettings(appSettings);
    }
    return appSettings;
  }

  @override
  Future<void> putAppSettings(AppSettingsModel appSettings) async {
    await _isar.writeTxn(() async {
      await _isar.appSettingsModels.put(appSettings);
    });
  }
}
