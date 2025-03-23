class ConfirmOtpParameters {
  ConfirmOtpParameters({
    required this.phoneNumber,
    required this.otp,
  });

  final String? phoneNumber;
  final String? otp;

  ConfirmOtpParameters copyWith({
    String? phoneNumber,
    String? otp,
  }) {
    return ConfirmOtpParameters(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      otp: otp ?? this.otp,
    );
  }

  factory ConfirmOtpParameters.fromJson(Map<String, dynamic> json) {
    return ConfirmOtpParameters(
      phoneNumber: json["phoneNumber"],
      otp: json["otp"],
    );
  }

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "otp": otp,
      };

  @override
  String toString() {
    return "$phoneNumber, $otp, ";
  }
}
