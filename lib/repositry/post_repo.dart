import 'dart:convert';
import 'dart:developer';
import 'package:apiwith_provider/repositry/base_repo.dart';
import 'package:apiwith_provider/utills/api_url.dart';

class PostRepositry extends BaseRepositry {
  //get all Users
  Future getAllUsers() async {
    final response = await getHttp(api: ApiUrls.user, token: false);
    log(response.body, name: 'getusersApi');
    return jsonDecode(response.body);
  }

  //get all posts
  Future getAllposts() async {
    final response = await getHttp(api: ApiUrls.post, token: false);
    log(response.body, name: 'getPostApi');
    return jsonDecode(response.body);
  }
}
