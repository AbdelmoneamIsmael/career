class RegisterPersonResponce {
  factory RegisterPersonResponce.fromJson(Map<String, dynamic> json) {
    return RegisterPersonResponce(
      success: json["success"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"],
    );
  }
  RegisterPersonResponce({
    required this.success,
    required this.data,
    required this.message,
  });

  final bool? success;
  final Data? data;
  final String? message;

  RegisterPersonResponce copyWith({
    bool? success,
    Data? data,
    String? message,
  }) {
    return RegisterPersonResponce(
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

class Data {
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      message: json["message"],
      isAuthenticated: json["isAuthenticated"],
      id: json["id"],
      personId: json["personId"],
      buisnessId: json["buisnessId"],
      username: json["username"],
      email: json["email"],
      deviceToken: json["deviceToken"],
      imageUrl: json["imageUrl"],
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
  Data({
    required this.message,
    required this.isAuthenticated,
    required this.id,
    required this.personId,
    required this.buisnessId,
    required this.username,
    required this.email,
    required this.deviceToken,
    required this.imageUrl,
    required this.roles,
    required this.token,
    required this.expiresOn,
    required this.refreshToken,
    required this.refreshTokenExpiration,
  });

  final String? message;
  final bool? isAuthenticated;
  final int? id;
  final num? personId;
  final num? buisnessId;
  final String? username;
  final String? email;
  final String? deviceToken;
  final String? imageUrl;
  final List<String> roles;
  final String? token;
  final DateTime? expiresOn;
  final String? refreshToken;
  final DateTime? refreshTokenExpiration;

  Data copyWith({
    String? message,
    bool? isAuthenticated,
    int? id,
    num? personId,
    num? buisnessId,
    String? username,
    String? email,
    String? deviceToken,
    String? imageUrl,
    List<String>? roles,
    String? token,
    DateTime? expiresOn,
    String? refreshToken,
    DateTime? refreshTokenExpiration,
  }) {
    return Data(
      message: message ?? this.message,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      id: id ?? this.id,
      personId: personId ?? this.personId,
      buisnessId: buisnessId ?? this.buisnessId,
      username: username ?? this.username,
      email: email ?? this.email,
      deviceToken: deviceToken ?? this.deviceToken,
      imageUrl: imageUrl ?? this.imageUrl,
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
        "roles": roles.map((x) => x).toList(),
        "token": token,
        "expiresOn": expiresOn?.toIso8601String(),
        "refreshToken": refreshToken,
        "refreshTokenExpiration": refreshTokenExpiration?.toIso8601String(),
      };

  @override
  String toString() {
    return "$message, $isAuthenticated, $id, $personId, $buisnessId, $username, $email, $deviceToken, $imageUrl, $roles, $token, $expiresOn, $refreshToken, $refreshTokenExpiration, ";
  }
}
