import 'flavors.dart';
import 'mainRunApp.dart';

Future<void> main() async {
  F.appFlavor = Flavor.stg;
  return mainRunApp();
}