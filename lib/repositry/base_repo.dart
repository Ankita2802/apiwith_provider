import 'dart:developer';
import 'package:apiwith_provider/utills/api_url.dart';
import 'package:http/http.dart' as http;

// class BaseRepositry {
//   Future<http.Response> getHttp({
//     required String api,
//     bool token = false,
//   }) async {
//     String? accessToken;
//     final url = ApiUrls.baseUrl + api;
//     //  if (token) {
//     //   accessToken =
//     //       await MySharedPreferences.instance.getStringValue("access_token");
//     //   log(accessToken.toString(), name: "access_token");
//     // }
//     final response = await http.get(
//       Uri.parse(url),
//       headers: token == nul
//           ? {'Content-Type': 'application/json'}
//           : {
//               'Content-Type': 'application/json',
//               'Authorization': 'Bearer $accessToken'
//             },
//     );
//     log(response.statusCode.toString());
//     //  if (response.statusCode == 403 && token) {
//     //   return refreshToken().then((value) => getHttp(api: api, token: token));
//     // }
//     return response;
//   }
// }

class BaseRepositry {
  Future<http.Response> getHttp(
      {required String api, bool token = false}) async {
    final url = ApiUrls.baseUrl + api;
    log(url, name: 'getUrl');

    final response = await http.get(Uri.parse(url));
    log(response.statusCode.toString());
    return response;
  }

  //second pets gethttp
  Future<http.Response> getHttp2(
      {required String api, bool token = false}) async {
    final url = ApiUrls.baseUrl2 + api;
    log(url.toString(), name: 'getPetsUrl');
    final response = await http.get(Uri.parse(url));
    log(response.statusCode.toString(), name: 'statusCode');
    return response;
  }
}
