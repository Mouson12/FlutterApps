// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrentModelAdapter extends TypeAdapter<CurrentModel> {
  @override
  final int typeId = 0;

  @override
  CurrentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrentModel(
      city: fields[0] as String?,
      country: fields[1] as String?,
      lat: fields[2] as double?,
      lon: fields[3] as double?,
      lastUpdated: fields[4] as String?,
      tempC: fields[5] as double?,
      tempF: fields[6] as double?,
      conditionText: fields[7] as String?,
      icon: fields[8] as String?,
      windMph: fields[9] as double?,
      windKph: fields[10] as double?,
      windDegree: fields[11] as int?,
      windDir: fields[12] as String?,
      pressureMb: fields[13] as double?,
      pressureIn: fields[14] as double?,
      humidity: fields[15] as int?,
      cloud: fields[16] as int?,
      feelslikeC: fields[17] as double?,
      feelslikeF: fields[18] as double?,
      visKm: fields[19] as double?,
      visMiles: fields[20] as double?,
      uv: fields[21] as double?,
      aqi: fields[22] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CurrentModel obj) {
    writer
      ..writeByte(23)
      ..writeByte(0)
      ..write(obj.city)
      ..writeByte(1)
      ..write(obj.country)
      ..writeByte(2)
      ..write(obj.lat)
      ..writeByte(3)
      ..write(obj.lon)
      ..writeByte(4)
      ..write(obj.lastUpdated)
      ..writeByte(5)
      ..write(obj.tempC)
      ..writeByte(6)
      ..write(obj.tempF)
      ..writeByte(7)
      ..write(obj.conditionText)
      ..writeByte(8)
      ..write(obj.icon)
      ..writeByte(9)
      ..write(obj.windMph)
      ..writeByte(10)
      ..write(obj.windKph)
      ..writeByte(11)
      ..write(obj.windDegree)
      ..writeByte(12)
      ..write(obj.windDir)
      ..writeByte(13)
      ..write(obj.pressureMb)
      ..writeByte(14)
      ..write(obj.pressureIn)
      ..writeByte(15)
      ..write(obj.humidity)
      ..writeByte(16)
      ..write(obj.cloud)
      ..writeByte(17)
      ..write(obj.feelslikeC)
      ..writeByte(18)
      ..write(obj.feelslikeF)
      ..writeByte(19)
      ..write(obj.visKm)
      ..writeByte(20)
      ..write(obj.visMiles)
      ..writeByte(21)
      ..write(obj.uv)
      ..writeByte(22)
      ..write(obj.aqi);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
