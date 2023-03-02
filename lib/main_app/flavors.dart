import '../features/app_config/app_config.dart';


enum Flavor{
  dev,
  stg,
  prd
}

class F{
  static Flavor? appFlavor;
  static AppConfigEnv get appConfigEnv{
    switch(appFlavor){
      case Flavor.dev:
        return AppConfigEnv.dev;
      case Flavor.stg:
        return AppConfigEnv.stg;
      case Flavor.prd:
        return AppConfigEnv.prd;
      default:
         return AppConfigEnv.prd;
    }
  }
}