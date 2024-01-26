// ignore_for_file: camel_case_types

import 'package:hive/hive.dart';
part 'order_model.g.dart';

@HiveType(typeId: 0)
class ordermodel {

  @HiveField(0)
  String stockName;
  @HiveField(1)
  String? lotNum;
  @HiveField(2)
  DateTime? entryDate;
  @HiveField(3)
  DateTime? expiryDate;
  @HiveField(4)
  DateTime? incomingDate;
  @HiveField(5)
  int initialAmount;
  @HiveField(6)
  int orderLimit;
  @HiveField(7)
  bool iscoming;
  @HiveField(8)
  int currentAmount;
  @HiveField(9)
  bool recieved;
  @HiveField(10)
  DateTime? orderedDate;
  @HiveField(11)
  bool isOrdered;

  ordermodel({
    this.iscoming=false,
    required this.orderLimit,
    required this.stockName,
     this.lotNum,
    required this.entryDate,
    required this.expiryDate,
    this.incomingDate,
    required this.initialAmount,
    required this.currentAmount,
    this.recieved=false,
    this.orderedDate,
    this.isOrdered=false
    });
}