import 'main_app/flavors.dart';
import 'main_app/mainRunApp.dart';

Future<void> main() async{
  F.appFlavor= Flavor.dev;
  return mainRunApp();
}