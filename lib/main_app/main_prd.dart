
import 'flavors.dart';
import 'main_run_app.dart';

Future<void> main() async {
  F.appFlavor = Flavor.prd;
  return mainRunApp();
}