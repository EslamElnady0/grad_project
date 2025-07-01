class AddQuestionResponseModel {
  final int code;
  final String message;
  final Object? data;

  AddQuestionResponseModel({
    required this.code,
    required this.message,
    this.data,
  });

  factory AddQuestionResponseModel.fromJson(Map<String, dynamic> json) {
    return AddQuestionResponseModel(
      code: json['code'] as int? ?? 0,
      message: json['message'] as String? ?? '',
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'data': data,
    };
  }
}
