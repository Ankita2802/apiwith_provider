import 'dart:developer';
import 'package:apiwith_provider/models/pets_model.dart';
import 'package:apiwith_provider/repositry/pets_repo.dart';
import 'package:flutter/material.dart';

class PetsProvider extends ChangeNotifier {
  PetsRepositry repo = PetsRepositry();
  bool isLoading = false;
  String error = '';
  PetsModel pets = PetsModel(data: []);
  Future getAllPets() async {
    try {
      final response = await repo.getPetsApi();
      pets = PetsModel.fromJson(response);
    } catch (e, s) {
      log(e.toString(), name: 'getPetsError', stackTrace: s);
    }
  }
}
