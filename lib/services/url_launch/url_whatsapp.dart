import 'dart:io';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class UrlLaunch {
  static String whatsappUrl = '+5511987654321';
  static callSupport() async {
    if (await canLaunch('tel:$whatsappUrl')) {
      await launch('tel:$whatsappUrl');
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  static Future<void> openWhatsApp() async {
    final whatsappUrlAndroid = 'https://wa.me/$whatsappUrl/';
    final whatsappUrlIos = 'https://api.whatsapp.com/send?phone=$whatsappUrl';

    if (Platform.isAndroid) {
      if (await canLaunch(whatsappUrlAndroid)) {
        await launch(whatsappUrlAndroid, forceSafariVC: false);
      } else {
        Get.snackbar('Erro', 'Ops, aconteceu algum erro ao abrir o WhatsApp');
      }
    } else {
      if (await canLaunch(whatsappUrlIos)) {
        await launch(whatsappUrlIos, forceSafariVC: false);
      } else {
        Get.snackbar('Erro', 'Ops, aconteceu algum erro ao abrir o hatsapp');
      }
    }
  }
}
