import 'package:url_launcher/url_launcher_string.dart';

Future<bool> redirectToUrl(
  String url, {
  LaunchMode mode = LaunchMode.externalApplication,
}) {
  return launchUrlString(
    url,
    mode: mode,
  );
}
