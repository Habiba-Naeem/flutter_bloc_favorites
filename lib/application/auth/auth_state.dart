part of 'auth_bloc.dart';

@immutable
class AuthState {
  final String colourInput;
  final int numberInput;
  final bool showErrors;

  const AuthState({
    required this.colourInput,
    required this.numberInput,
    required this.showErrors,
  });

  factory AuthState.initial() {
    return const AuthState(
      colourInput: '',
      numberInput: 0,
      showErrors: false,
    );
  }

  AuthState copyWith(
      {String? colourInput,
      int? numberInput,
      bool? showErrors,}) {
    return AuthState(
      colourInput: colourInput ?? this.colourInput,
      numberInput: numberInput ?? this.numberInput,
      showErrors: showErrors ?? this.showErrors,
    );
  }
}
