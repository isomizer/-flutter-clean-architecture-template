
import 'flavors.dart';
import 'mainRunApp.dart';

Future<void> main() async {
  F.appFlavor = Flavor.prd;
  return mainRunApp();
}