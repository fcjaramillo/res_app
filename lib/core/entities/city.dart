import 'package:equatable/equatable.dart';

class City extends Equatable{

  final String description;
  final int placeId;
  final String name;
  final String state;

  const City({
    required this.description,
    required this.placeId,
    required this.name,
    required this.state,
  });


  @override
  List<Object?> get props => [
    description,
    placeId,
    name,
    state
  ];
}