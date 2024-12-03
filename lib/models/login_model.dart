class LoginModel {
  final bool status;
  final String? message;
  final String? token;

  LoginModel({
    required this.status,
    this.message,
    this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'] ?? false,
      message: json['message'],
      token: json['token'],
    );
  }
}
