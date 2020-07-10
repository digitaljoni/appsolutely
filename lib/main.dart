import 'package:appsolutely/app/flavor.dart';
import 'package:appsolutely/utils/enums/env_type.dart';

void main() => Development();

class Development extends Flavor {
  @override
  EnvType envType = EnvType.DEVELOPMENT;
}
