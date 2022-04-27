import 'dart:convert';
import 'package:bytebank/http/webclient.dart';
import 'package:http/http.dart';

final Uri messagesUri = Uri.https(
    "gist.githubusercontent.com",
    "stroherdebora/"
        "4af6389358e7487f88e2bba09504a380/" /* GIST_ID */

        "raw/"
        "5ad37bd43c769e806fe422c360141500d26e9fe6/" /* COMMIT_ID */

        "i18n.json" /* FILE_NAME */);

class I18NWebClient {
  Future<Map<String, dynamic>> findAll() async {
    final Response response = await client.get(messagesUri);

    final Map<String, dynamic> decodedJson = jsonDecode(response.body);

    return decodedJson;
  }
}
