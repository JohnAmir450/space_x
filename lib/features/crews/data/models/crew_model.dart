import 'package:equatable/equatable.dart';

class CrewModel extends Equatable {
  final String? name;
  final String? agency;
  final String? image;
  final String? wikipedia;
  final List<dynamic>? launches;
  final String? status;
  final String? id;

  const CrewModel({
    this.name,
    this.agency,
    this.image,
    this.wikipedia,
    this.launches,
    this.status,
    this.id,
  });

  factory CrewModel.fromJson(Map<String, dynamic> json) => CrewModel(
        name: json['name'] as String?,
        agency: json['agency'] as String?,
        image: json['image'] as String?,
        wikipedia: json['wikipedia'] as String?,
        launches: json['launches'] as List<dynamic>?,
        status: json['status'] as String?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'agency': agency,
        'image': image,
        'wikipedia': wikipedia,
        'launches': launches,
        'status': status,
        'id': id,
      };

  @override
  List<Object?> get props {
    return [
      name,
      agency,
      image,
      wikipedia,
      launches,
      status,
      id,
    ];
  }
}
