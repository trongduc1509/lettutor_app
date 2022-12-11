import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../base/define/navigation/navigation.dart';
import '../blocs/initialization_bloc.dart';
import '../blocs/initialization_state.dart';
import '../widgets/splash.dart';

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
                .pushReplacement(NavigationService.createLoginRoute());
          }
        }
      },
      child: const Splash(),
    );
  }
}
