import 'package:custom_state/custom_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/base/define/navigation/navigation.dart';
import 'package:lettutor_app/base/define/text.dart';
import 'package:lettutor_app/feature/authentication/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:lettutor_app/shared/widgets/progress_button.dart';

import '../../../../../gen/assets.gen.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) => BlocListener<LoginBloc, LoginState>(
        listener: (context, state) async {
          if (state is LoginDoneState) {
            await Navigator.of(context).pushReplacement(
              NavigationService.createHomeRoute(),
            );
          } else if (state is LoginErrorState) {}
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            centerTitle: true,
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
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/background.png',
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.height * 1 / 5,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Say hello to your English tutors',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text(
                    'Become fluent faster through one on one video chat lessons tailored to your goals.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
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
                            ))),
                    onChanged: (value) => context.read<LoginBloc>().add(
                          LoginValidateEvent(
                            email: value,
                            password: _passController.text,
                          ),
                        ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text(
                    'PASSWORD',
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
                    controller: _passController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ))),
                    onChanged: (value) => context.read<LoginBloc>().add(
                          LoginValidateEvent(
                            email: _emailController.text,
                            password: value,
                          ),
                        ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        NavigationService.createForgotPasswordRoute(),
                      );
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xFF286AD2),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginValidateState) {
                        return ProgressButton(
                          label: TextDoc.login,
                          states: state.buttonState,
                          onTab: () =>
                              context.read<LoginBloc>().add(LoginSendEvent(
                                    email: _emailController.text,
                                    password: _passController.text,
                                  )),
                        );
                      } else if (state is LoginProcessingState) {
                        return ProgressButton(
                          label: TextDoc.login,
                          states: const {ButtonState.progressing},
                          onTab: () =>
                              context.read<LoginBloc>().add(LoginSendEvent(
                                    email: _emailController.text,
                                    password: _passController.text,
                                  )),
                        );
                      }
                      return ProgressButton(
                        label: TextDoc.login,
                        states: const {ButtonState.initial},
                        onTab: () =>
                            context.read<LoginBloc>().add(LoginSendEvent(
                                  email: _emailController.text,
                                  password: _passController.text,
                                )),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Center(
                    child: Text(
                      'Or continue with',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            Assets.images.facebook.path,
                            height: 40.0,
                            width: 40.0,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            Assets.images.google.path,
                            height: 40.0,
                            width: 40.0,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Not a member yet? ',
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushReplacement(
                                  NavigationService.createRegisterRoute(),
                                );
                              },
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
