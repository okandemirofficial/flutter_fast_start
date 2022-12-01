import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'app_settings_model.g.dart';

///It creates app settings which will be stored on cache.
///May contanin first load data or user token.
@collection
@immutable
class AppSettingsModel {
  ///Factory constructor for app settings model;
  const AppSettingsModel({required this.isFirstLaunch, this.id = 1});

  ///inits first app settings model to save the cache.
  ///Please initialize all of your app settings to here with default values
  factory AppSettingsModel.initAppSettings() {
    return const AppSettingsModel(isFirstLaunch: false);
  }

  ///its for isar
  ///Since we have only 1 appSettings model. Id is constant
  final Id id;

  ///Is application opened for the first time?
  final bool isFirstLaunch;
}
