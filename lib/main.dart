import 'package:appsolutely/app/core/app_flavor.dart';
import 'package:appsolutely/app/utils/enums/flavor_type.dart';

void main() => Development();

class Development extends AppFlavor {
  @override
  FlavorType flavorType = FlavorType.DEVELOPMENT;
}
