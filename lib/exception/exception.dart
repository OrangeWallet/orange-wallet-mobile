class CanNotLaunchUrlException implements Exception {
  final String url;

  CanNotLaunchUrlException(this.url);

  @override
  String toString() => 'Could not launch $url';
}
