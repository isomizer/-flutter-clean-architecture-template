// ignore_for_file: constant_identifier_names

library app_config;

enum AppConfigEnv {
  dev,
  stg,
  prd,
}

// Environment value are set from command line Args
// with `--dart-define`
// default value are dev value
// https://dartcode.org/docs/using-dart-define-in-flutter/
// ``` --dart-define MY_OTHER_VAR=MY_OTHER_VALUE ```
// stg and prd environment value are set in CI/CD
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

  String get graphQLURL => const String.fromEnvironment(
        "graph_ql_url",
      );
  Uri get graphQLURI => Uri.parse(graphQLURL);

  String get graphQLV3URL => const String.fromEnvironment(
        "graph_ql_v3_url",
      );
  Uri get graphQLV3URI => Uri.parse(graphQLV3URL);

  String get graphQLApiKey => const String.fromEnvironment(
        "graph_ql_key",
      );

  String get graphQLV3ApiKey => const String.fromEnvironment(
        "graph_ql_v3_key",
      );

  String get webviewBaseURL => const String.fromEnvironment(
        "webview_base_url",
      );
  Uri get webviewBaseURI => Uri.parse(webviewBaseURL);

  String get dynamicLinkBaseURL => const String.fromEnvironment(
        'dynamiclink_base_url',
        defaultValue: 'https://dl.isuzu-tis.com',
      );
  Uri get dynamicLinkBaseURI => Uri.parse(dynamicLinkBaseURL);

  String get firebaseDynamicLinkURL => const String.fromEnvironment(
        'firebase_dynamiclink_url',
        defaultValue: 'com.tis.myisuzu://google/link/',
      );
  Uri get firebaseDynamicLinkURI => Uri.parse(firebaseDynamicLinkURL);

  String get lineChannel => const String.fromEnvironment(
        "line_channel",
      );
}
