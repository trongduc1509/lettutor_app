import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/define/navigation/navigation.dart';
import '../../../../base/util/notifier.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/custom_shimmer.dart';
import '../../../../shared/widgets/date_picker.dart';
import '../blocs/profile_bloc/profile_bloc.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({
    Key? key,
    required this.profileBloc,
  }) : super(key: key);

  final ProfileBloc profileBloc;

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  DateTime? _dobController;
  final TextEditingController _levelController = TextEditingController();
  int countryIndexSelected = 0;
  final List<String> levelList = [
    'BEGINNER',
    'HIGHER_BEGINNER',
    'PRE_INTERMEDIATE',
    'INTERMEDIATE',
    'UPPER_INTERMEDIATE',
    'ADVANCED',
    'PROFICIENCY'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) async {
        if (state is ProfileLogoutState) {
          await Navigator.of(context).pushAndRemoveUntil(
            NavigationService.createLoginRoute(),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 20.0,
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          if (state is ProfileLoadDoneState) {
                            _nameController.text =
                                state.userInfo.userName ?? '';
                            _countryController.text =
                                state.userInfo.userCountry ?? '';
                            _phoneController.text =
                                state.userInfo.userPhone ?? '';
                            // _levelController.text =
                            //     state.userInfo.userLevel ?? '';
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Stack(
                                    alignment: AlignmentDirectional.centerStart,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: CachedNetworkImage(
                                          height: 100,
                                          width: 100,
                                          imageUrl:
                                              state.userInfo.userImg ?? '',
                                          placeholder: (context, url) =>
                                              MyShimmer.shimmerBuilder(
                                            child: Container(
                                              color: Colors.white,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(Assets
                                                        .images
                                                        .blankAva
                                                        .path))),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          padding: const EdgeInsets.all(5.0),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.blue,
                                          ),
                                          child: IconButton(
                                              onPressed: () {},
                                              iconSize: 20,
                                              padding: const EdgeInsets.all(0),
                                              constraints:
                                                  const BoxConstraints(),
                                              icon: const Icon(
                                                Icons.edit,
                                                color: Colors.white,
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  state.userInfo.userName ?? '',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12.0,
                                ),
                                Text(
                                  'Account ID: ${state.userInfo.userId ?? ""}',
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                const Text(
                                  'Account Detail',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: '* ',
                                    style: DefaultTextStyle.of(context)
                                        .style
                                        .copyWith(
                                            color: Colors.red, fontSize: 15.0),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: 'Name',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  controller: _nameController,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: state.userInfo.userName ??
                                        'Account name',
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 4.0,
                                      horizontal: 10.0,
                                    ),
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Email Address',
                                    style: DefaultTextStyle.of(context)
                                        .style
                                        .copyWith(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  readOnly: true,
                                  initialValue: state.userInfo.userEmail,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: state.userInfo.userEmail ??
                                        'student@lettutor.com',
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 4.0,
                                      horizontal: 10.0,
                                    ),
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: '* ',
                                    style: DefaultTextStyle.of(context)
                                        .style
                                        .copyWith(
                                            color: Colors.red, fontSize: 15.0),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: 'Country',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  controller: _countryController,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  decoration: const InputDecoration(
                                      hintText: 'Account country',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 4.0,
                                        horizontal: 10.0,
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ))),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                RichText(
                                  text: const TextSpan(
                                      text: 'Phone Number',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.black)),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  controller: _phoneController,
                                  readOnly: true,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: state.userInfo.userPhone ??
                                        'Phone Number',
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 4.0,
                                      horizontal: 10.0,
                                    ),
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: '* ',
                                    style: DefaultTextStyle.of(context)
                                        .style
                                        .copyWith(
                                            color: Colors.red, fontSize: 15.0),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: 'Birthday',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                DatePickerView(
                                  date:
                                      _dobController ?? state.userInfo.userDob,
                                  active: true,
                                  isTo: false,
                                  title: 'Date of birth',
                                  onDateChosen: (timeChosen) {
                                    setState(() {
                                      _dobController = timeChosen;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Level',
                                    style: DefaultTextStyle.of(context)
                                        .style
                                        .copyWith(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  readOnly: true,
                                  controller: _levelController
                                    ..text = _levelController.text.isNotEmpty
                                        ? _levelController.text
                                        : state.userInfo.userLevel ?? 's',
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  onTap: () {
                                    Notifier.showCheckBottomSheet(
                                      context,
                                      listData: levelList,
                                      selectedIndex: (_levelController
                                              .text.isNotEmpty)
                                          ? levelList.indexWhere((element) =>
                                              element == _levelController.text)
                                          : ((state.userInfo.userLevel !=
                                                      null &&
                                                  state.userInfo.userLevel!
                                                      .isNotEmpty)
                                              ? levelList.indexWhere(
                                                  (element) =>
                                                      element ==
                                                      state.userInfo.userLevel)
                                              : null),
                                      onSelected: (value) {
                                        setState(() {
                                          _levelController.text =
                                              levelList[value];
                                        });
                                      },
                                    );
                                  },
                                  decoration: const InputDecoration(
                                      hintText: 'Level',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 4.0,
                                        horizontal: 10.0,
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ))),
                                ),
                              ],
                            );
                          } else if (state is ProfileLoadingState) {
                            return const Center(
                              child: CupertinoActivityIndicator(),
                            );
                          }
                          return const Center(
                            child: Text(
                              'Error while loading profile data...',
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         const BecomeTeacherPage(),
                                    //   ));
                                  },
                                  child: const Text('Become a tutor')),
                              ElevatedButton(
                                  onPressed: () {
                                    context.read<ProfileBloc>().add(
                                          ProfileUpdateEvent(
                                            name: _nameController.text.trim(),
                                            country:
                                                _countryController.text.trim(),
                                            phone: _phoneController.text.trim(),
                                            birthday: _dobController ??
                                                (state is ProfileLoadDoneState
                                                    ? state.userInfo.userDob ??
                                                        DateTime.now()
                                                    : DateTime.now()),
                                            level: _levelController
                                                    .text.isNotEmpty
                                                ? _levelController.text.trim()
                                                : (state is ProfileLoadDoneState
                                                    ? state.userInfo
                                                            .userLevel ??
                                                        'BEGINNGER'
                                                    : 'BEGINNER'),
                                          ),
                                        );
                                  },
                                  child: const Text('Save changes')),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: ElevatedButton(
                      onPressed: () => context
                          .read<ProfileBloc>()
                          .add(const ProfileLogoutEvent()),
                      child: const Text('Sign out'),
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
}
