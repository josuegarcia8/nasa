import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class MiFotoNasaCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'miFotoNasa',
      apiUrl: 'https://api.nasa.gov/planetary/apod',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'api_key': "71V0Bhx2Yw14IfeRrNpaGsg4WdaknmgaDXEsVQHP",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic fecha(dynamic response) => getJsonField(
        response,
        r'''$.date''',
      );
  static dynamic resumen(dynamic response) => getJsonField(
        response,
        r'''$.explanation''',
      );
  static dynamic titulo(dynamic response) => getJsonField(
        response,
        r'''$.title''',
      );
  static dynamic imagen(dynamic response) => getJsonField(
        response,
        r'''$.url''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
