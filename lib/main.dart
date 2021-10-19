import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:favorites/presentation/auth/favs/fav_screen.dart';
import 'package:favorites/presentation/theme/theme.dart';

import 'application/auth/auth_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      home: BlocProvider(
        create: (context) => AuthBloc(),
        child: const FavScreen(),
      ),
    );
  }
}
