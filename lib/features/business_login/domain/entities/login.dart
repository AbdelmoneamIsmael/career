class LoginPrameters {
  LoginPrameters({required this.email, required this.password, this.fcmToken});
  final String email;
  final String password;
  final String? fcmToken;
  Map toJson() => {
        "username": email,
        "password": password,
        "deviceToken": fcmToken,
      };
}
