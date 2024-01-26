

import 'package:flutter/material.dart';
import 'package:kuhl_store/features/addOrderScreen/data/order_model.dart';

@immutable
sealed class HistoryIncomState {}

final class HistoryIncomInitial extends HistoryIncomState {}
final class HistoryIncomSucess extends HistoryIncomState {
  final List <ordermodel> incomStocksHis;
  HistoryIncomSucess({required this.incomStocksHis});
}
final class HistoryIncomLoading extends HistoryIncomState {}
final class HistoryIncomfailure extends HistoryIncomState {
  
}
