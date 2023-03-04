import 'main_app/flavors.dart';
import 'main_app/app.dart';

Future<void> main() async{
  F.appFlavor= Flavor.dev;
  return app();
}