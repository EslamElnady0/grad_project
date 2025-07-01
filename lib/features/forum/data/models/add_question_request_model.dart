class AddQuestionRequestModel {
  final String body;
  final String image;

  AddQuestionRequestModel({
    required this.body,
    required this.image,
  });

  factory AddQuestionRequestModel.fromJson(Map<String, dynamic> json) {
    return AddQuestionRequestModel(
      body: json['body'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'body': body,
      'image': image,
    };
  }
}
