part of 'add_stock_cubit.dart';


sealed class AddStockState {}

final class AddStockInitial extends AddStockState {}

final class AddStockLoading extends AddStockState {}

final class AddStockSucess extends AddStockState {}

// ignore: must_be_immutable
final class AddStockFailure extends AddStockState {
String errorMessgae;

AddStockFailure({required this.errorMessgae});

}
