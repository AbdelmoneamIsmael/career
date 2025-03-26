class ResetPassResponce {
  factory ResetPassResponce.fromJson(Map<String, dynamic> json) {
    return ResetPassResponce(
      success: json["success"],
      data: json["data"],
      message: json["message"],
    );
  }
  ResetPassResponce({
    required this.success,
    required this.data,
    required this.message,
  });

  final bool? success;
  final String? data;
  final String? message;

  ResetPassResponce copyWith({
    bool? success,
    String? data,
    String? message,
  }) {
    return ResetPassResponce(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data,
        "message": message,
      };

  @override
  String toString() {
    return "$success, $data, $message, ";
  }
}
