import 'package:url_launcher/url_launcher.dart';

launchURLApp(String youtubeURL) async {
  var url = Uri.parse(youtubeURL);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
