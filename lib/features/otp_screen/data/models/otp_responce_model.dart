import 'package:hive/hive.dart';
part  "otp_responce_model.g.dart";
class OtpResponseModel {
  factory OtpResponseModel.fromJson(Map<String, dynamic> json) {
    return OtpResponseModel(
      success: json["success"],
      data: json["data"] == null ? null : LoginInfo.fromJson(json["data"]),
      message: json["message"],
    );
  }
  OtpResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });

  final bool? success;
  final LoginInfo? data;
  final dynamic message;

  OtpResponseModel copyWith({
    bool? success,
    LoginInfo? data,
    dynamic message,
  }) {
    return OtpResponseModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "message": message,
      };

  @override
  String toString() {
    return "$success, $data, $message, ";
  }
}
  @HiveType(typeId: 1)
class LoginInfo {
  factory LoginInfo.fromJson(Map<String, dynamic> json) {
    return LoginInfo(
      message: json["message"],
      isAuthenticated: json["isAuthenticated"],
      id: json["id"],
      personId: json["personId"],
      buisnessId: json["buisnessId"],
      username: json["username"],
      email: json["email"],
      deviceToken: json["deviceToken"],
      imageUrl: json["imageUrl"],
      phoneNumber: json["phoneNumber"],
      roles: json["roles"] == null
          ? []
          : List<String>.from(json["roles"]!.map((x) => x)),
      token: json["token"],
      expiresOn: DateTime.tryParse(json["expiresOn"] ?? ""),
      refreshToken: json["refreshToken"],
      refreshTokenExpiration:
          DateTime.tryParse(json["refreshTokenExpiration"] ?? ""),
    );
  }
  LoginInfo({
    required this.message,
    required this.isAuthenticated,
    required this.id,
    required this.personId,
    required this.buisnessId,
    required this.username,
    required this.email,
    required this.deviceToken,
    required this.imageUrl,
    required this.phoneNumber,
    required this.roles,
    required this.token,
    required this.expiresOn,
    required this.refreshToken,
    required this.refreshTokenExpiration,
  });
  @HiveField(0)
  final String? message;
  @HiveField(1)
  final bool? isAuthenticated;
  @HiveField(2)
  final int? id;
  @HiveField(3)
  final dynamic personId;
  @HiveField(4)
  final num? buisnessId;
    @HiveField(5)
  final String? username;
  @HiveField(6)
  final String? email;
  @HiveField(7)
  final String? deviceToken;
  @HiveField(8)
  final dynamic imageUrl;
  @HiveField(9)
  final String? phoneNumber;
  @HiveField(10)
  final List<String> roles;
  @HiveField(11)
  final String? token;
  @HiveField(12)
  final DateTime? expiresOn;
  @HiveField(13)
  final String? refreshToken;
  @HiveField(14)
  final DateTime? refreshTokenExpiration;

  LoginInfo copyWith({
    String? message,
    bool? isAuthenticated,
    int? id,
    dynamic personId,
    num? buisnessId,
    String? username,
    String? email,
    String? deviceToken,
    dynamic imageUrl,
    String? phoneNumber,
    List<String>? roles,
    String? token,
    DateTime? expiresOn,
    String? refreshToken,
    DateTime? refreshTokenExpiration,
  }) {
    return LoginInfo(
      message: message ?? this.message,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      id: id ?? this.id,
      personId: personId ?? this.personId,
      buisnessId: buisnessId ?? this.buisnessId,
      username: username ?? this.username,
      email: email ?? this.email,
      deviceToken: deviceToken ?? this.deviceToken,
      imageUrl: imageUrl ?? this.imageUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      roles: roles ?? this.roles,
      token: token ?? this.token,
      expiresOn: expiresOn ?? this.expiresOn,
      refreshToken: refreshToken ?? this.refreshToken,
      refreshTokenExpiration:
          refreshTokenExpiration ?? this.refreshTokenExpiration,
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "isAuthenticated": isAuthenticated,
        "id": id,
        "personId": personId,
        "buisnessId": buisnessId,
        "username": username,
        "email": email,
        "deviceToken": deviceToken,
        "imageUrl": imageUrl,
        "phoneNumber": phoneNumber,
        "roles": roles.map((x) => x).toList(),
        "token": token,
        "expiresOn": expiresOn?.toIso8601String(),
        "refreshToken": refreshToken,
        "refreshTokenExpiration": refreshTokenExpiration?.toIso8601String(),
      };

  @override
  String toString() {
    return "$message, $isAuthenticated, $id, $personId, $buisnessId, $username, $email, $deviceToken, $imageUrl, $phoneNumber, $roles, $token, $expiresOn, $refreshToken, $refreshTokenExpiration, ";
  }
}
