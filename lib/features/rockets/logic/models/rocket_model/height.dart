import 'package:equatable/equatable.dart';

class Height extends Equatable {
  final double? meters;
  final dynamic feet;

  const Height({this.meters, this.feet});

  factory Height.fromJson(Map<String, dynamic> json) => Height(
        meters: (json['meters'] as num?)?.toDouble(),
        feet: json['feet'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'meters': meters,
        'feet': feet,
      };

  @override
  List<Object?> get props => [meters, feet];
}