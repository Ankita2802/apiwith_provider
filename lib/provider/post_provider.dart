import 'dart:convert';
import 'dart:developer';

import 'package:apiwith_provider/models/pets_model.dart';
import 'package:apiwith_provider/models/post_model.dart';
import 'package:apiwith_provider/models/user_model.dart';
import 'package:apiwith_provider/repositry/post_repo.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  List<PostsModel> postmodel = [];
  UsersModel? userModel;
  PostRepositry repo = PostRepositry();
  //get all Users
  Future<void> getAllUsers() async {
    try {
      final response = await repo.getAllUsers();
      log(response.toString(), name: 'getUsers');
      userModel = UsersModel.fromJson(response);
      notifyListeners();
    } catch (e, s) {
      log(e.toString(), name: 'error getUsers', stackTrace: s);
    }
  }

  Future<void> getPostApi() async {
    try {
      final response = await repo.getAllposts();
      log(response.toString(), name: 'getposts');
      postmodel = response
          .map<PostsModel>((json) => PostsModel.fromJson(json))
          .toList();
      notifyListeners();
    } catch (e, s) {
      log(e.toString(), name: 'error getPosts', stackTrace: s);
    }
  }
}
