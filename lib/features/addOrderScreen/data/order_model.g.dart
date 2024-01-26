// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ordermodelAdapter extends TypeAdapter<ordermodel> {
  @override
  final int typeId = 0;

  @override
  ordermodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ordermodel(
      iscoming: fields[7] as bool,
      orderLimit: fields[6] as int,
      stockName: fields[0] as String,
      lotNum: fields[1] as String?,
      entryDate: fields[2] as DateTime?,
      expiryDate: fields[3] as DateTime?,
      incomingDate: fields[4] as DateTime?,
      initialAmount: fields[5] as int,
      currentAmount: fields[8] as int,
      recieved: fields[9] as bool,
      orderedDate: fields[10] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ordermodel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.stockName)
      ..writeByte(1)
      ..write(obj.lotNum)
      ..writeByte(2)
      ..write(obj.entryDate)
      ..writeByte(3)
      ..write(obj.expiryDate)
      ..writeByte(4)
      ..write(obj.incomingDate)
      ..writeByte(5)
      ..write(obj.initialAmount)
      ..writeByte(6)
      ..write(obj.orderLimit)
      ..writeByte(7)
      ..write(obj.iscoming)
      ..writeByte(8)
      ..write(obj.currentAmount)
      ..writeByte(9)
      ..write(obj.recieved)
      ..writeByte(10)
      ..write(obj.orderedDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ordermodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
