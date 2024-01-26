part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}

final class OrderSucess extends OrdersState {
  final List <ordermodel> orders;
  OrderSucess({required this.orders});
}

final class OrderLoading extends OrdersState {}

final class OrderFailure extends OrdersState {
  final String errorMessge;
  OrderFailure({required this.errorMessge});
}

