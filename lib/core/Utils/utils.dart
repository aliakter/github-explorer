import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

String formatDate(DateTime? date) {
  if (date == null) return '-';
  final localDate = date.toLocal();
  final formatter = DateFormat('dd-MM-yyyy hh:mm:ss a');
  return formatter.format(localDate);
}

Future<void> launchRepo(String? url) async {
  if (url == null || url.isEmpty) {
    Get.snackbar('Error', 'Invalid URL');
    return;
  }

  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  } else {
    Get.snackbar('Error', 'Could not open the URL');
  }
}
