part of 'orders_history_cubit.dart';

@immutable
sealed class OrdersHistoryState {}

final class OrdersHistoryInitial extends OrdersHistoryState {}
final class OrderHistorySucess extends OrdersHistoryState {
  final List <ordermodel> orderedStocksHis;
  OrderHistorySucess({required this.orderedStocksHis});
}
final class OrderHistoryLoading extends OrdersHistoryState {}
final class OrderHistoryfailure extends OrdersHistoryState {
  
}
