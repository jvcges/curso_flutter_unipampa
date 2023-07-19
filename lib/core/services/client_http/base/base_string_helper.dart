class BaseStringHelper {
  final String baseUrl;
  final String protocol;
  final Duration timeout;

  BaseStringHelper({
    this.baseUrl = "#",
    this.protocol = "https",
    this.timeout = const Duration(milliseconds: 20000),
  });

  factory BaseStringHelper.staging() {
    const staging = 'https://api.github.com';
    return BaseStringHelper(baseUrl: staging);
  }

  String get fullUrl => '$protocol://$baseUrl';
}
