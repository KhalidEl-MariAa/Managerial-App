part of 'history_IN_cubit.dart';

@immutable
sealed class HistoryINState {}

final class HistoryINInitial extends HistoryINState {}
final class HistoryINSucess extends HistoryINState {
  final List <ordermodel> addedStocksHis;
  HistoryINSucess({required this.addedStocksHis});
}
final class HistoryINLoading extends HistoryINState {}
final class HistoryINfailure extends HistoryINState {
  
}
