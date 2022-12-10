import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/feature/authentication/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:lettutor_app/feature/authentication/presentation/views/login_view/login_content.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: const LoginContent(),
    );
  }
}
