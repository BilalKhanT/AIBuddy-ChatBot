import 'package:equatable/equatable.dart';

class ResponseParams extends Equatable{
  final String text;

  ResponseParams(this.text);

  @override
  List<Object> get props => [text];
}