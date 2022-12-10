import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_app/feature/authentication/forgot_password.dart';
import 'package:lettutor_app/feature/authentication/register_page.dart';

import '../../gen/assets.gen.dart';
import '../home/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
    this.continueRoute,
  }) : super(key: key);

  final Route? continueRoute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                //controller: ,
                decoration: const InputDecoration(
                    hintText: 'mail@example.com',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ))),
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
                //controller: ,
                obscureText: true,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ))),
              ),
              const SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ForgotPasswordPage())),
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
              Center(
                child: TextButton(
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'LOG IN',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  )),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
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
                    text: 'Not a member yet? ',
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              )),
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
    );
  }
}
