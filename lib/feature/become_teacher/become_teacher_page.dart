import 'package:flutter/material.dart';
import 'package:lettutor_app/base/define/style/default_style.dart';
import 'package:lettutor_app/base/theme/colors.dart';
import 'package:lettutor_app/shared/widgets/date_picker.dart';

class BecomeTeacherPage extends StatefulWidget {
  const BecomeTeacherPage({Key? key}) : super(key: key);

  @override
  State<BecomeTeacherPage> createState() => _BecomeTeacherPageState();
}

class _BecomeTeacherPageState extends State<BecomeTeacherPage> {
  DateTime dob = DateTime(2001, 01, 01);
  int _activeStepIndex = 0;
  List<Step> stepsList() => [
        Step(
            isActive: _activeStepIndex >= 0,
            title: const Text('Profile'),
            content: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: Theme.of(context).dividerColor,
                          ),
                          child: const SizedBox(
                            height: 1.5,
                            width: 15.0,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Text(
                          'Basic info',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Theme.of(context).dividerColor,
                            ),
                            child: const SizedBox(
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor().greyBackground,
                        border: Border.all(
                          color: AppColor().greyBorder,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          'Avatar',
                          style: DefaultStyle().t14Medium,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Tap to upload'),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Tutoring name',
                        style: DefaultStyle()
                            .t16Medium
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      readOnly: true,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                          hintText: 'name',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 10.0,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ))),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "I'm from",
                        style: DefaultStyle()
                            .t16Medium
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      readOnly: true,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                          hintText: 'country',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 10.0,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ))),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Date of birth',
                        style: DefaultStyle()
                            .t16Medium
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    DatePickerView(
                      date: dob,
                      active: true,
                      isTo: false,
                      title: 'Date of birth',
                      onDateChosen: (timeChosen) {
                        setState(() {
                          dob = timeChosen;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: Theme.of(context).dividerColor,
                          ),
                          child: const SizedBox(
                            height: 1.5,
                            width: 15.0,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Text(
                          'CV',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Theme.of(context).dividerColor,
                            ),
                            child: const SizedBox(
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Interests',
                        style: DefaultStyle()
                            .t16Medium
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      readOnly: true,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                          hintText: 'Interests',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 10.0,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ))),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Education',
                        style: DefaultStyle()
                            .t16Medium
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      readOnly: true,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                          hintText: 'Education',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 10.0,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ))),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Experience',
                        style: DefaultStyle()
                            .t16Medium
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      readOnly: true,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                          hintText: 'Experience',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 10.0,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ))),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Current or Previous Profession',
                        style: DefaultStyle()
                            .t16Medium
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      readOnly: true,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 10.0,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ))),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: Theme.of(context).dividerColor,
                          ),
                          child: const SizedBox(
                            height: 1.5,
                            width: 15.0,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Text(
                          'Languages I speak',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Theme.of(context).dividerColor,
                            ),
                            child: const SizedBox(
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Languages',
                        style: DefaultStyle()
                            .t16Medium
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      readOnly: true,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                          hintText:
                              'Example: English, Vietnamese, Chinese, Korean',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 10.0,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ))),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: Theme.of(context).dividerColor,
                          ),
                          child: const SizedBox(
                            height: 1.5,
                            width: 15.0,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Text(
                          'Who I teach',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Theme.of(context).dividerColor,
                            ),
                            child: const SizedBox(
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Introduction',
                        style: DefaultStyle()
                            .t16Medium
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      readOnly: true,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                          hintText:
                              'Example: "I was a doctor for 35 years and can help you practice business or medical English. I also enjoy teaching beginners as I am very patient and always speak slowly and clearly. "',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 10.0,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ))),
                    ),
                  ],
                ),
              ),
            )),
        Step(
          isActive: _activeStepIndex >= 1,
          title: const Text('Introduction'),
          content: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20.0,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Theme.of(context).dividerColor,
                        ),
                        child: const SizedBox(
                          height: 1.5,
                          width: 15.0,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      const Text(
                        'Introduction Video',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Theme.of(context).dividerColor,
                          ),
                          child: const SizedBox(
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor().blueLightBg,
                      border: Border.all(
                        color: AppColor().blueLightBorder,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'A few helpful tips:',
                          style: DefaultStyle().t14Regular,
                        ),
                        Text(
                          ' 1. Find a clean and quiet space',
                          style: DefaultStyle().t14Regular,
                        ),
                        Text(
                          ' 2. Smile and look at the camera',
                          style: DefaultStyle().t14Regular,
                        ),
                        Text(
                          ' 3. Dress smart',
                          style: DefaultStyle().t14Regular,
                        ),
                        Text(
                          ' 4. Speak for 1-3 minutes',
                          style: DefaultStyle().t14Regular,
                        ),
                        Text(
                          ' 5. Brand yourself and have fun!',
                          style: DefaultStyle().t14Regular,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Choose video',
                      style: TextStyle(
                        color: AppColor().blueLightTxt,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(
                        color: AppColor().blueLightBorder,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Step(
          isActive: _activeStepIndex >= 2,
          title: const Text('Approval'),
          content: Center(
            child: Text('APPROVED!!!',
                style:
                    DefaultStyle().t20Bold.copyWith(color: AppColor().success)),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _activeStepIndex,
        steps: stepsList(),
        onStepContinue: () {
          final isLastStep = _activeStepIndex == stepsList().length - 1;

          if (!isLastStep) {
            setState(() => _activeStepIndex += 1);
          } else {
            Navigator.of(context).pop();
          }
        },
        onStepCancel: () {
          if (_activeStepIndex != 0) {
            setState(() => _activeStepIndex -= 1);
          }
        },
      ),
    );
  }
}
