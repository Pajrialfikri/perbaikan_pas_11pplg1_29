import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controllers/login_controller.dart';
import '../widgets/my_text_field.dart';
import '../widgets/my_button.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to LeagueApp",
              style: GoogleFonts.manrope(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Login now to explore more about football leagues!",
              style: GoogleFonts.manrope(
                fontSize: 13,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 100),
            MyTextField(
              controller: _usernameController,
              labelText: 'Username',
            ),
            const SizedBox(height: 16),
            MyTextField(
              controller: _passwordController,
              labelText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 24),
            Obx(() {
              return MyButton(
                onPressed: () {
                  _loginController.login(
                    _usernameController.text,
                    _passwordController.text,
                  );
                },
                text: _loginController.isLoading.value ? "Loading..." : "Login",
                isLoading: _loginController.isLoading.value,
              );
            }),
          ],
        ),
      ),
    );
  }
}
