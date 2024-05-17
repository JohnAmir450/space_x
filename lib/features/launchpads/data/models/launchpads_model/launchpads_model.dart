import 'package:equatable/equatable.dart';

import 'images.dart';

class LaunchpadsModel extends Equatable {
  final Images? images;
  final String? name;
  final String? fullName;
  final String? locality;
  final String? region;
  final double? latitude;
  final double? longitude;
  final int? launchAttempts;
  final int? launchSuccesses;
  final List<dynamic>? rockets;
  final String? timezone;
  final List<dynamic>? launches;
  final String? status;
  final String? details;
  final String? id;

  const LaunchpadsModel({
    this.images,
    this.name,
    this.fullName,
    this.locality,
    this.region,
    this.latitude,
    this.longitude,
    this.launchAttempts,
    this.launchSuccesses,
    this.rockets,
    this.timezone,
    this.launches,
    this.status,
    this.details,
    this.id,
  });

  factory LaunchpadsModel.fromJson(Map<String, dynamic> json) {
    return LaunchpadsModel(
      images: json['images'] == null
          ? null
          : Images.fromJson(json['images'] as Map<String, dynamic>),
      name: json['name'] as String?,
      fullName: json['full_name'] as String?,
      locality: json['locality'] as String?,
      region: json['region'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      launchAttempts: json['launch_attempts'] as int?,
      launchSuccesses: json['launch_successes'] as int?,
      rockets: json['rockets'] as List<dynamic>?,
      timezone: json['timezone'] as String?,
      launches: json['launches'] as List<dynamic>?,
      status: json['status'] as String?,
      details: json['details'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'images': images?.toJson(),
        'name': name,
        'full_name': fullName,
        'locality': locality,
        'region': region,
        'latitude': latitude,
        'longitude': longitude,
        'launch_attempts': launchAttempts,
        'launch_successes': launchSuccesses,
        'rockets': rockets,
        'timezone': timezone,
        'launches': launches,
        'status': status,
        'details': details,
        'id': id,
      };

  @override
  List<Object?> get props {
    return [
      images,
      name,
      fullName,
      locality,
      region,
      latitude,
      longitude,
      launchAttempts,
      launchSuccesses,
      rockets,
      timezone,
      launches,
      status,
      details,
      id,
    ];
  }
}
