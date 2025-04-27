class CreateMessageResponse {
  final bool success;
  final String message;
  final Map<String, dynamic> data;

  CreateMessageResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CreateMessageResponse.fromJson(Map<String, dynamic> json) {
    return CreateMessageResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] as Map<String, dynamic>,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data,
      };
}
