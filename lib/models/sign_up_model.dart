import 'package:happy_tech_mastering_api_with_flutter/core/api/end_points.dart';

class SignUpModel {
  String? message;

  SignUpModel({this.message});

  SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    message = jsonData[ApiKey.successMessage];
  }
}