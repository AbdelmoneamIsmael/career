// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_responce_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginInfoAdapter extends TypeAdapter<LoginInfo> {
  @override
  final int typeId = 1;

  @override
  LoginInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginInfo(
      message: fields[0] as String?,
      isAuthenticated: fields[1] as bool?,
      id: fields[2] as int?,
      personId: fields[3] as dynamic,
      buisnessId: fields[4] as num?,
      username: fields[5] as String?,
      email: fields[6] as String?,
      deviceToken: fields[7] as String?,
      imageUrl: fields[8] as dynamic,
      phoneNumber: fields[9] as String?,
      roles: (fields[10] as List).cast<String>(),
      token: fields[11] as String?,
      expiresOn: fields[12] as DateTime?,
      refreshToken: fields[13] as String?,
      refreshTokenExpiration: fields[14] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, LoginInfo obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.message)
      ..writeByte(1)
      ..write(obj.isAuthenticated)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.personId)
      ..writeByte(4)
      ..write(obj.buisnessId)
      ..writeByte(5)
      ..write(obj.username)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.deviceToken)
      ..writeByte(8)
      ..write(obj.imageUrl)
      ..writeByte(9)
      ..write(obj.phoneNumber)
      ..writeByte(10)
      ..write(obj.roles)
      ..writeByte(11)
      ..write(obj.token)
      ..writeByte(12)
      ..write(obj.expiresOn)
      ..writeByte(13)
      ..write(obj.refreshToken)
      ..writeByte(14)
      ..write(obj.refreshTokenExpiration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
