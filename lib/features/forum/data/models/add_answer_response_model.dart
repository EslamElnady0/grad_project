class AddAnswerResponseModel {
  final int? code;
  final String? message;
  final dynamic data;

  AddAnswerResponseModel({
    this.code,
    this.message,
    this.data,
  });

  Map<String, dynamic> toJson() => {
    'code': code,
    'message': message,
    'data': data,
  };

  factory AddAnswerResponseModel.fromJson(Map<String, dynamic> json) =>
      AddAnswerResponseModel(
        code: json['code'],
        message: json['message'],
        data: json['data'],
      );
}
