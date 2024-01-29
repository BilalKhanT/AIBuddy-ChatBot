import 'package:equatable/equatable.dart';

class ResponseEntity extends Equatable{
  final String text;

  ResponseEntity({required this.text});

  @override
  List<Object?> get props => [text];


}