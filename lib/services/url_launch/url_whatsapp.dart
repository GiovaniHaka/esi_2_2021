import 'package:url_launcher/url_launcher.dart';

class UrlLaunch {
  callSupport() async {
    String whatsappUrl = 'tel:+5511987654321';

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }
}
