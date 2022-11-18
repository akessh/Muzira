// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalSongsAdapter extends TypeAdapter<LocalSongs> {
  @override
  final int typeId = 0;

  @override
  LocalSongs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalSongs(
      title: fields[0] as String?,
      artist: fields[1] as String?,
      id: fields[2] as int?,
      uri: fields[3] as String?,
      duration: fields[4] as int?,
      count: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, LocalSongs obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.artist)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.uri)
      ..writeByte(4)
      ..write(obj.duration)
      ..writeByte(5)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalSongsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
