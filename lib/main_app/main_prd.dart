
import 'flavors.dart';
import 'app.dart';

Future<void> main() async {
  F.appFlavor = Flavor.prd;
  return app();
}