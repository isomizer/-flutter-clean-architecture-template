enum AppConfigEnv {
  dev,
  stg,
  prd,
}


class AppConfig {
  static final AppConfig _singleton = AppConfig._internal();
  factory AppConfig() => _singleton;
  AppConfig._internal();

  bool _isInit = false;

  late AppConfigEnv env;
  bool _isTesting = false;
  bool get isTesting => _isTesting;

  bool get isDev => env == AppConfigEnv.dev;
  bool get isStg => env == AppConfigEnv.stg;
  bool get isPrd => env == AppConfigEnv.prd;

  Future<void> init(AppConfigEnv e, {bool isTesting = false}) async {
    if (_isInit) return;
    env = e;
    _isTesting = isTesting;
    _isInit = true;
  }

  String get assetBaseURL => const String.fromEnvironment(
        'asset_base_url',
      );
  Uri get assetBaseURI => Uri.parse(assetBaseURL);

  String get apiURL => const String.fromEnvironment(
        "api_url",
      );
  Uri get apiURI => Uri.parse(apiURL);
}
