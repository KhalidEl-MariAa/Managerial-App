

import 'package:kuhl_store/features/addOrderScreen/data/order_model.dart';

sealed class GetStocksState {}

final class GetStocksInitial extends GetStocksState {}
final class GetStocksSucess extends GetStocksState {
  List <ordermodel> stocks;
  GetStocksSucess({required this.stocks});
}
final class GetStocksLoading extends GetStocksState {}
final class GetStocksFailure extends GetStocksState {
  final String errorMessge;
  GetStocksFailure({required this.errorMessge});
}
final class UpdateStockSucess extends GetStocksState {}