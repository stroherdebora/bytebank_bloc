import 'dart:convert';
import 'package:bytebank/http/webclient.dart';
import 'package:http/http.dart';

final Uri messagesUri = Uri.https(
    "gist.githubusercontent.com",
    "stroherdebora/"
        "4af6389358e7487f88e2bba09504a380/" /* GIST_ID */

        "raw"
        "a6435c9cbcd7c6619238009fd499e6f7eee6356d/" /* COMMIT_ID */

        "i18n.json" /* FILE_NAME */);

class I18NWebClient {
  Future<Map<String, String>> findAll() async {
    final Response response = await client.get(messagesUri);

    final Map<String, String> decodedJson = jsonDecode(response.body);

    return decodedJson;
  }
}
