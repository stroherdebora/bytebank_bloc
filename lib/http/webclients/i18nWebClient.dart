import 'dart:convert';
import 'package:bytebank/http/webclient.dart';
import 'package:http/http.dart';

final Uri messagesUri = Uri.https(
    "gist.githubusercontent.com",
    "stroherdebora/"
        "4af6389358e7487f88e2bba09504a380/" /* GIST_ID */

        "raw/"
        "b30d8399faf3db17f65666fbbaec13551eec3e35/" /* COMMIT_ID */

    // "i18n.json" /* FILE_NAME */
    );

class I18NWebClient {
  final String _viewKey;

  I18NWebClient(this._viewKey);
  Future<Map<String, dynamic>> findAll() async {
    final Response response = await client.get(Uri.parse("$messagesUri$_viewKey.json"));

    final Map<String, dynamic> decodedJson = jsonDecode(response.body);

    return decodedJson;
  }
}
