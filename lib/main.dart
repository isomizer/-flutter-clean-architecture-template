import 'main_app/flavors.dart';
import 'main_app/main_run_app.dart';

Future<void> main() async{
  F.appFlavor= Flavor.dev;
  return mainRunApp();
}