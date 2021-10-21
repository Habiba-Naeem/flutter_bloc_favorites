import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:favorites/application/auth/auth_bloc.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        print('ui rebuild');
        return Scaffold(
          appBar: AppBar(
            title: const Text("Fav"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              autovalidateMode: state.showErrors
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: Column(
                children: [
                  ColourInput(),
                  const SizedBox(height: 8),
                  NumberInput(),
                  SubmitButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ColourInput extends StatelessWidget {
  const ColourInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
            labelText: "Colour",
          ),
          onChanged: (v) {
            //tell bloc that Colour Changed event has happened
            context.read<AuthBloc>().add(ColourInputEvent(input: v));
          },
          validator: (v) {
            if (state.showErrors && state.colourInput != 'Blue') {
              return "Not Habiba's Favorite Colour!";
            }
          },
        );
      },
    );
  }
}

class NumberInput extends StatelessWidget {
  const NumberInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Number",
          ),
          onChanged: (v) {
            //tell bloc that Colour Changed event has happened
            /*try {
              context
                  .read<AuthBloc>()
                  .add(NumberInputEvent(input: int.parse(v)));
            } catch (_) {
              v = '';
            }*/
            context.read<AuthBloc>().add(NumberInputEvent(input: v));
          },
          validator: (v) {
            if (state.showErrors && state.numberInput != 10) {
              return "Not Habiba's Favorite Number!";
            }
          },
        );
      },
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Congratulations!'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('You guessed everything correctly!'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Next'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return MaterialButton(
          child: const Text("Guess Habiba's Favorites!"),
          color: Colors.blue,
          onPressed: () {
            //tell bloc that sign in button was pressed
            if (state.colourInput == "Blue" && state.numberInput == 10) {
              _showMyDialog();
            }
            context.read<AuthBloc>().add(SubmitButtonPressedEvent());
          },
        );
      },
    );
  }
}
