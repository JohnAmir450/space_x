import 'package:equatable/equatable.dart';

class Images extends Equatable {
  final List<dynamic>? large;

  const Images({this.large});

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        large: json['large'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'large': large,
      };

  @override
  List<Object?> get props => [large];
}
