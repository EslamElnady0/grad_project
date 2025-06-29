class AddAnswerRequestModel {
  final String body;
  final String? image;

  AddAnswerRequestModel({
    required this.body,
    this.image,
  });

  Map<String, dynamic> toJson() => {
    'body': body,
    'image': image ?? "", // Send empty string instead of null
  };

  factory AddAnswerRequestModel.fromJson(Map<String, dynamic> json) =>
      AddAnswerRequestModel(
        body: json['body'] ?? '',
        image: json['image'],
      );
}
