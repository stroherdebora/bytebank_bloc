import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

// TODO cuidados caso você queira thread safety

final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
);
