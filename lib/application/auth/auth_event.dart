part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class ColourInputEvent extends AuthEvent {
  final String input;

  ColourInputEvent({required this.input});
}

class NumberInputEvent extends AuthEvent {
  final int input;

  NumberInputEvent({required this.input});
}
class SubmitButtonPressedEvent extends AuthEvent {
  
  SubmitButtonPressedEvent();
}
