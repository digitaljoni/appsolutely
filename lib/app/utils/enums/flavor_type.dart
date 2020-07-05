enum FlavorType { DEVELOPMENT, STAGING, PRODUCTION }

extension FlavorTypeParser on FlavorType {
  String toShortString() {
    final value = this;
    return value.toString().split('.').last;
  }

  static FlavorType parseString(String value) {
    return FlavorType.values.firstWhere((e) => e.toShortString() == value);
  }
}
