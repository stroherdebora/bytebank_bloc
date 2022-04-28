import 'dart:convert';
import 'package:bytebank/http/webclient.dart';
import 'package:http/http.dart';

final Uri messagesUri = Uri.https(
    "gist.githubusercontent.com",
    "stroherdebora/"
        "4af6389358e7487f88e2bba09504a380/" /* GIST_ID */

        "raw/"
        "f138f1fd48fe63f9cf772a7fae784b3b8783792e/" /* COMMIT_ID */

        "i18n.json" /* FILE_NAME */);

class I18NWebClient {
  Future<Map<String, dynamic>> findAll() async {
    final Response response = await client.get(messagesUri);

    final Map<String, dynamic> decodedJson = jsonDecode(response.body);

    return decodedJson;
  }
}
