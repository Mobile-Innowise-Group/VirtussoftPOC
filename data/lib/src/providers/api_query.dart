library api_query;

import 'dart:convert';

class ApiQuery {
  final String endpoint;
  final Map<String, dynamic>? params;
  final Map<String, dynamic>? body;

  const ApiQuery({
    required this.endpoint,
    required this.body,
    required this.params,
  });

  String get jsonEncodedBody => jsonEncode(body);

  String get path {
    return endpoint;
  }

  String get data {
    return jsonEncodedBody;
  }
}
