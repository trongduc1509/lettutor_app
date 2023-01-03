import 'package:custom_state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/shared/widgets/progress_button.dart';

import '../../../../base/define/style/default_style.dart';
import '../../../../base/define/text.dart';
import '../../../../base/util/notifier.dart';
import '../../../../gen/assets.gen.dart';
import '../blocs/change_password_bloc/change_password_bloc.dart';

class ChangePasswordContent extends StatefulWidget {
  const ChangePasswordContent({Key? key}) : super(key: key);

  @override
  State<ChangePasswordContent> createState() => _ChangePasswordContentState();
}

class _ChangePasswordContentState extends State<ChangePasswordContent> {
  final _currentPassController = TextEditingController();
  final _newPassController = TextEditingController();
  final _passConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      BlocListener<ChangePassBloc, ChangePassState>(
        listener: (context, state) async {
          if (state is ChangePassDoneState) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Change password successfully',
                      style: DefaultStyle().t12Medium.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is ChangePassErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Icon(
                      Icons.cancel,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      state.exception.message,
                      style: DefaultStyle().t12Medium.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: Navigator.of(context).pop,
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.blue,
              ),
            ),
            centerTitle: true,
            title: Image.asset(
              Assets.images.lettutorLogo.path,
              fit: BoxFit.scaleDown,
              width: 200,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Change Password',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Current Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  obscureText: true,
                  controller: _currentPassController,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'current password',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 10.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  onChanged: (value) => context.read<ChangePassBloc>().add(
                        ChangePassValidateEvent(
                          currentPass: value,
                          newPass: _newPassController.text,
                          confirmPass: _passConfirmController.text,
                        ),
                      ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'New Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  obscureText: true,
                  controller: _newPassController,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'new password',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 10.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  onChanged: (value) => context.read<ChangePassBloc>().add(
                        ChangePassValidateEvent(
                          currentPass: _currentPassController.text,
                          newPass: value,
                          confirmPass: _passConfirmController.text,
                        ),
                      ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Confirm New Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  obscureText: true,
                  controller: _passConfirmController,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'confirm password',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 10.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  onChanged: (value) => context.read<ChangePassBloc>().add(
                        ChangePassValidateEvent(
                          currentPass: _currentPassController.text,
                          newPass: _newPassController.text,
                          confirmPass: value,
                        ),
                      ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                BlocBuilder<ChangePassBloc, ChangePassState>(
                  builder: (context, state) {
                    if (state is ChangePassLoadingState) {
                      return ProgressButton(
                        label: TextDoc.changePass,
                        states: const {ButtonState.progressing},
                        onTab: () => context.read<ChangePassBloc>().add(
                              ChangePassSendEvent(
                                currentPass: _currentPassController.text,
                                newPass: _newPassController.text,
                              ),
                            ),
                      );
                    } else if (state is ChangePassValidateState) {
                      return ProgressButton(
                        label: TextDoc.changePass,
                        states: state.buttonState,
                        onTab: () => context.read<ChangePassBloc>().add(
                              ChangePassSendEvent(
                                currentPass: _currentPassController.text,
                                newPass: _newPassController.text,
                              ),
                            ),
                      );
                    } else if (state is ChangePassErrorState) {
                      return ProgressButton(
                        label: TextDoc.changePass,
                        states: const {ButtonState.initial},
                        onTab: () => context.read<ChangePassBloc>().add(
                              ChangePassSendEvent(
                                currentPass: _currentPassController.text,
                                newPass: _newPassController.text,
                              ),
                            ),
                      );
                    }
                    return ProgressButton(
                      label: TextDoc.changePass,
                      states: const {ButtonState.forceDisabled},
                      onTab: () => context.read<ChangePassBloc>().add(
                            ChangePassSendEvent(
                              currentPass: _currentPassController.text,
                              newPass: _newPassController.text,
                            ),
                          ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
