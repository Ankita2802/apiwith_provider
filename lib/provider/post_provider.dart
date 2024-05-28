import 'dart:developer';
import 'package:apiwith_provider/models/comments_model.dart';
import 'package:apiwith_provider/models/post_model.dart';
import 'package:apiwith_provider/models/user_model.dart';
import 'package:apiwith_provider/repositry/post_repo.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  List<PostsModel> postmodel = [];
  List<UserModel> userModel = [];
  List<CommentsModel> commentModel = [];
  UserModel? user;
  // CommentsModel? commentsModel;
  PostRepositry repo = PostRepositry();
  String _userId = '';
  String get getUserid => _userId;
  set setUserid(value) => _userId = value;

  String _id = '';
  String get getid => _id;
  set setid(value) => _id = value;
  //get all Users
  Future<void> getAllUsers() async {
    try {
      final response = await repo.getAllUsers();
      log(response.toString(), name: 'getUsers');
      userModel =
          response.map<UserModel>((json) => UserModel.fromJson(json)).toList();

      notifyListeners();
    } catch (e, s) {
      log(e.toString(), name: 'error getUsers', stackTrace: s);
    }
  }

  // get particulat users api
  Future<void> getParticulatUsers(String id) async {
    try {
      final response = await repo.getParicularUsers(id);
      log(response.toString(), name: 'getUsersParticlarid');
      user = UserModel.fromJson(response);
      notifyListeners();
    } catch (e, s) {
      log(e.toString(), name: 'error getUsersparticular', stackTrace: s);
    }
  }

  //get comments
  Future<void> getCommentsAPI(int postID) async {
    try {
      final response = await repo.comments(postID);
      log(response.toString(), name: 'Response comments api');
      commentModel = CommentsModel.fromJson(response) as List<CommentsModel>;
      notifyListeners();
    } catch (e, s) {
      log(e.toString(), name: 'error comments api', stackTrace: s);
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
