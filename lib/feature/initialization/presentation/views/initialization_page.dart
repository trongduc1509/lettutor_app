import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/feature/authentication/domain/repositories/authentication_repository.dart';
import 'package:lettutor_app/feature/initialization/presentation/blocs/initialization_bloc.dart';
import 'package:lettutor_app/feature/initialization/presentation/views/initialization_content.dart';

import '../../../../di/di_module.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => InitializationBloc(
          authRepo: getIt.get<AuthenticationRepository>(),
        ),
        child: const StartContent(),
      ),
    );
  }
}
