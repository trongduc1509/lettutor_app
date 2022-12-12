import 'package:custom_state/custom_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/navigation/navigation.dart';
import '../../../../../base/define/text.dart';
import '../../../../../shared/widgets/progress_button.dart';
import '../../blocs/register_bloc/register_bloc.dart';

class RegisterContent extends StatefulWidget {
  const RegisterContent({Key? key}) : super(key: key);

  @override
  State<RegisterContent> createState() => _RegisterContentState();
}

class _RegisterContentState extends State<RegisterContent> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) async {
          if (state is RegisterDoneState) {
            await Navigator.of(context).pushReplacement(
              NavigationService.createHomeRoute(),
            );
          } else if (state is RegisterErrorState) {}
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            centerTitle: true,
            // leading: IconButton(
            //     onPressed: Navigator.of(context).pop,
            //     icon: const Icon(
            //       Icons.arrow_back_ios_new,
            //       color: Colors.blue,
            //     )),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/lettutor_logo.png',
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
                        ),
                      ),
                    ),
                    onChanged: (value) => context.read<RegisterBloc>().add(
                          RegisterValidateEvent(
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
                        ),
                      ),
                    ),
                    onChanged: (value) => context.read<RegisterBloc>().add(
                          RegisterValidateEvent(
                            email: _emailController.text,
                            password: value,
                          ),
                        ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      if (state is RegisterValidateState) {
                        return ProgressButton(
                          label: TextDoc.signUp,
                          states: state.buttonState,
                          onTab: () => context
                              .read<RegisterBloc>()
                              .add(RegisterSendEvent(
                                email: _emailController.text,
                                password: _passController.text,
                              )),
                        );
                      } else if (state is RegisterProcessingState) {
                        return ProgressButton(
                          label: TextDoc.signUp,
                          states: const {ButtonState.progressing},
                          onTab: () => context
                              .read<RegisterBloc>()
                              .add(RegisterSendEvent(
                                email: _emailController.text,
                                password: _passController.text,
                              )),
                        );
                      }
                      return ProgressButton(
                        label: TextDoc.signUp,
                        states: const {ButtonState.initial},
                        onTab: () =>
                            context.read<RegisterBloc>().add(RegisterSendEvent(
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
                            'assets/images/facebook.png',
                            height: 40.0,
                            width: 40.0,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/google.png',
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
                        text: 'Already have an account? ',
                        children: [
                          TextSpan(
                            text: 'Log in',
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => Navigator.of(context).pushReplacement(
                                        NavigationService.createLoginRoute(),
                                      ),
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
