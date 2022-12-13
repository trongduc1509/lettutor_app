import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/home_bloc/home_bloc.dart';
import 'home_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(),
        child: const HomeContent(),
      );
}
