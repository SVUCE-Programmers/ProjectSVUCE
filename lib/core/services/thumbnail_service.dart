import 'package:http/http.dart' as http;
import 'package:svuce_app/app/AppSetup.logger.dart';

class ThumbnailService {
  final log = getLogger("ThumbnailService");
  static const String _thumbUrl = "http://noembed.com/embed?url=";
  getThumbnail(String url) async {
    String finalUrl = _thumbUrl + url;
    var res = await http.get(Uri.parse(finalUrl));
    log.wtf(res.body);
  }
}
