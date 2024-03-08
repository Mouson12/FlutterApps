// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'current_model.g.dart';

@HiveType(typeId: 0)
class CurrentModel {
  @HiveField(0)
  final String? city;
  @HiveField(1)
  final String? country;
  @HiveField(2)
  final double? lat;
  @HiveField(3)
  final double? lon;
  @HiveField(4)
  final String? lastUpdated;
  @HiveField(5)
  final double? tempC;
  @HiveField(6)
  final double? tempF;
  @HiveField(7)
  final String? conditionText;
  @HiveField(8)
  final String? icon;
  @HiveField(9)
  final double? windMph;
  @HiveField(10)
  final double? windKph;
  @HiveField(11)
  final int? windDegree;
  @HiveField(12)
  final String? windDir;
  @HiveField(13)
  final double? pressureMb;
  @HiveField(14)
  final double? pressureIn;
  @HiveField(15)
  final int? humidity;
  @HiveField(16)
  final int? cloud;
  @HiveField(17)
  final double? feelslikeC;
  @HiveField(18)
  final double? feelslikeF;
  @HiveField(19)
  final double? visKm;
  @HiveField(20)
  final double? visMiles;
  @HiveField(21)
  final double? uv;
  @HiveField(22)
  final int? aqi;
  @HiveField(23)
  final int? id;

  CurrentModel({
    this.city,
    this.country,
    this.lat,
    this.lon,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.conditionText,
    this.icon,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.aqi,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'city': city,
      'country': country,
      'lat': lat,
      'lon': lon,
      'lastUpdated': lastUpdated,
      'tempC': tempC,
      'tempF': tempF,
      'conditionText': conditionText,
      'icon': icon,
      'windMph': windMph,
      'windKph': windKph,
      'windDegree': windDegree,
      'windDir': windDir,
      'pressureMb': pressureMb,
      'pressureIn': pressureIn,
      'humidity': humidity,
      'cloud': cloud,
      'feelslikeC': feelslikeC,
      'feelslikeF': feelslikeF,
      'visKm': visKm,
      'visMiles': visMiles,
      'uv': uv,
      'aqi': aqi,
      'id': id,
    };
  }

  factory CurrentModel.fromMap(Map<String, dynamic> map) {
    final location = map['location'] as Map<String, dynamic>;
    final current = map['current'] as Map<String, dynamic>;

    return CurrentModel(
      city: location['name'] as String?,
      country: location['country'] as String?,
      lat: location['lat'] as double?,
      lon: location['lon'] as double?,
      lastUpdated: current['last_updated'] as String?,
      tempC: current['temp_c'] as double?,
      tempF: current['temp_f'] as double?,
      conditionText: current['condition']['text'] as String?,
      icon: current['condition']['icon'] as String?,
      windMph: current['wind_mph'] as double?,
      windKph: current['wind_kph'] as double?,
      windDegree: current['wind_degree'] as int?,
      windDir: current['wind_dir'] as String?,
      pressureMb: current['pressure_mb'] as double?,
      pressureIn: current['pressure_in'] as double?,
      humidity: current['humidity'] as int?,
      cloud: current['cloud'] as int?,
      feelslikeC: current['feelslike_c'] as double?,
      feelslikeF: current['feelslike_f'] as double?,
      visKm: current['vis_km'] as double?,
      visMiles: current['vis_miles'] as double?,
      uv: current['uv'] as double?,
      aqi: current['air_quality']['us-epa-index'] as int?,
      id: current['id'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentModel.fromJson(String source) =>
      CurrentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
