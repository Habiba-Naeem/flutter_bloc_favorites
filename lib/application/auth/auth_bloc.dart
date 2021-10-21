import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is ColourInputEvent) {
      yield state.copyWith(colourInput: event.input);
    }
    if (event is NumberInputEvent) {
      yield state.copyWith(numberInput: int.parse(event.input));
    }
    
    if (event is SubmitButtonPressedEvent) {
      yield state.copyWith(showErrors: true) ;
    }
  }
}
