import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/base/define/navigation/navigation.dart';
import 'package:lettutor_app/feature/initialization/presentation/blocs/initialization_bloc.dart';
import 'package:lettutor_app/feature/initialization/presentation/blocs/initialization_state.dart';
import 'package:lettutor_app/feature/initialization/presentation/widgets/splash.dart';

class StartContent extends StatelessWidget {
  const StartContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<InitializationBloc, InitializationState>(
      //listenWhen: (previous, current) => previous != current,
      listener: (context, state) async {
        if (state.authenticationState != AuthenticationState.initial) {
          if (state.authenticationState == AuthenticationState.authenicated) {
            await Navigator.of(context)
                .pushReplacement(NavigationService.createHomeRoute());
          } else {
            await Navigator.of(context)
                .pushReplacement(NavigationService.createAuthRoute());
          }
        }
      },
      child: const Splash(),
    );
  }
}
