import '../../domain/entities/response_entity.dart';

class ResponseModel extends ResponseEntity{
  final String text;

  ResponseModel({required this.text}) : super(text: text);

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      text: json['candidates'][0]['content']['parts'][0]['text'],
    );
  }
}