import 'package:appsolutely/core/flavor.dart';

void main() => Development();

class Development extends Flavor {
  @override
  FlavorType flavorType = FlavorType.DEVELOPMENT;
}
