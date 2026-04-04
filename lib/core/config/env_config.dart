// lib/core/config/env_config.dart
class EnvConfig {
  static const bool isProduction = bool.fromEnvironment('IS_PRODUCTION', defaultValue: false);
  static const String supportEmail = String.fromEnvironment('SUPPORT_EMAIL', defaultValue: 'help@kandaq.app');
}