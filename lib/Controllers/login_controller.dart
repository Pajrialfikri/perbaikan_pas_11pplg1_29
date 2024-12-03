import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/login_model.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  Future<void> login(String username, String password) async {
    isLoading.value = true;


      final response = await http.post(
        Uri.parse('https://mediadwi.com/api/latihan/login'),
        body: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        LoginModel loginModel = LoginModel.fromJson(data);

        if (loginModel.status) {
          Get.snackbar(
            "Login Sukses",
            "Status: ${loginModel.status}\nMessage: ${loginModel.message}\nToken: ${loginModel.token}",
            backgroundColor: Colors.white,
            colorText: Colors.black,
          );
          Get.offNamed("/home");
        } else {
          Get.snackbar(
            "Login Gagal",
            loginModel.message ?? "Terjadi kesalahan",
            backgroundColor: Colors.white,
            colorText: Colors.black,
          );
        }
      }
  }
}
