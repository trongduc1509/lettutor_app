import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/profile_bloc/profile_bloc.dart';
import 'profile_content.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _profileBloc = ProfileBloc();
    return BlocProvider(
      create: (context) => _profileBloc..add(const ProfileInitEvent()),
      child: ProfileContent(
        profileBloc: _profileBloc,
      ),
    );
  }
}
