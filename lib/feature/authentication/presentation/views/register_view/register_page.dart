import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/register_bloc/register_bloc.dart';
import 'register_content.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(),
        child: const RegisterContent(),
      );
}
