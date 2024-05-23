import 'dart:convert';
import 'dart:developer';
import 'package:apiwith_provider/repositry/base_repo.dart';
import 'package:apiwith_provider/utills/api_url.dart';

class PetsRepositry extends BaseRepositry {
  //get all pets
  Future getPetsApi() async {
    final response = await getHttp2(api: ApiUrls.pets);
    log(response.body, name: 'getPetsResponse');
    return jsonDecode(response.body);
  }
}
