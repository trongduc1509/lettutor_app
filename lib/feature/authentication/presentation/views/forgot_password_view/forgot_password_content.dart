import 'package:custom_state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/base/define/navigation/navigation.dart';

import '../../../../../base/define/text.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../shared/widgets/progress_button.dart';
import '../../blocs/forgot_password_bloc/forgot_password_bloc.dart';

class ForgotPassContent extends StatefulWidget {
  const ForgotPassContent({Key? key}) : super(key: key);

  @override
  State<ForgotPassContent> createState() => _ForgotPassContentState();
}

class _ForgotPassContentState extends State<ForgotPassContent> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      BlocListener<ForgotPassBloc, ForgotPassState>(
        listener: (context, state) async {
          if (state is ForgotPassDoneState) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
                .showSnackBar(
              SnackBar(
                content: Text(state.result.forgotPassMessage ?? ''),
              ),
            );
          } else if (state is ForgotPassErrorState) {}
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
                onPressed: Navigator.of(context).pop,
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.blue,
                )),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    Assets.images.lettutorLogo.path,
                    height: 24.0,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.language,
                        size: 24.0,
                        color: Theme.of(context).primaryColor,
                      )),
                ]),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      Assets.images.background.path,
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.height * 1 / 5,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Center(
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    'Please enter your email address to search for your account.',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text(
                    'EMAIL',
                    style: TextStyle(
                      color: Color(0xFFA4B0BE),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'mail@example.com',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    onChanged: (value) => context.read<ForgotPassBloc>().add(
                          ForgotPassValidateEvent(
                            email: value,
                          ),
                        ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  BlocBuilder<ForgotPassBloc, ForgotPassState>(
                    builder: (context, state) {
                      if (state is ForgotPassValidateState) {
                        return ProgressButton(
                          label: TextDoc.sendResetLink,
                          states: state.buttonState,
                          onTab: () => context
                              .read<ForgotPassBloc>()
                              .add(ForgotPassSendEvent(
                                email: _emailController.text,
                              )),
                        );
                      } else if (state is ForgotPassProcessingState) {
                        return ProgressButton(
                          label: TextDoc.sendResetLink,
                          states: const {ButtonState.progressing},
                          onTab: () => context
                              .read<ForgotPassBloc>()
                              .add(ForgotPassSendEvent(
                                email: _emailController.text,
                              )),
                        );
                      }
                      return ProgressButton(
                        label: TextDoc.sendResetLink,
                        states: const {ButtonState.initial},
                        onTab: () => context
                            .read<ForgotPassBloc>()
                            .add(ForgotPassSendEvent(
                              email: _emailController.text,
                            )),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
