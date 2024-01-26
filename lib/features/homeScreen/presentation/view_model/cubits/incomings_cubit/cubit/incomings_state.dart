part of 'incomings_cubit.dart';

@immutable
sealed class IncomingsState {}

final class IncomingsInitial extends IncomingsState {}
final class IncomingsSucess extends IncomingsState {
  final List <ordermodel> incomings;
  IncomingsSucess({required this.incomings});
}

final class Incomingsoading extends IncomingsState {}

final class IncomingsFailure extends IncomingsState {
  final String errorMessge;
  IncomingsFailure({required this.errorMessge});
}

