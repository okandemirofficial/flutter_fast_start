import 'package:flutter_fast_start/core/cache/app_settings_model.dart';
import 'package:flutter_fast_start/core/cache/isar_cache_repository.dart';

///You may want to redirect to [IsarCacheRepository]
abstract class CacheRepository {
  ///Gets main cache data
  AppSettingsModel getAppsettings();

  ///Inits main cache data
  AppSettingsModel initAppSettings() {
    return AppSettingsModel.initAppSettings();
  }

  ///Edit main cache data
  Future<void> putAppSettings(AppSettingsModel appSettings);
}
