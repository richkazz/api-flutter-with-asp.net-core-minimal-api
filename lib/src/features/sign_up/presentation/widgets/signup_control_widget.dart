import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/colors/app_color.dart';
import '../../../../../util/input_validation.dart';
import '../../../../../widgets/text_field.dart';
import '../../../login/presentation/pages/login_page.dart';
import '../bloc/signup_bloc.dart';

class SignUpControl extends StatefulWidget {
  const SignUpControl({Key? key}) : super(key: key);

  @override
  State<SignUpControl> createState() => _SignUpControlState();
}

class _SignUpControlState extends State<SignUpControl> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 16), backgroundColor: colorPurple);
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          textField(
              validator: InputValidator.nameValidator,
              keyboard: TextInputType.text,
              hintText: 'Name',
              labelText: 'Name',
              context: context,
              controller: nameController),
          const SizedBox(height: 15),
          textField(
              validator: InputValidator.emailValidator,
              keyboard: TextInputType.emailAddress,
              hintText: 'Email',
              labelText: 'Email',
              context: context,
              controller: emailController),
          const SizedBox(height: 15),
          textField(
              validator: InputValidator.passwordValidator,
              keyboard: TextInputType.text,
              hintText: 'Password',
              labelText: 'Password',
              obscureText: true,
              context: context,
              controller: passwordController),
          const SizedBox(height: 15),
          textField(
              validator: (val) {
                InputValidator.confirmPasswordValidator(
                    passwordController.text, confirmPasswordController.text);
              },
              keyboard: TextInputType.text,
              hintText: 'Confirm Password',
              labelText: 'Confirm Password',
              obscureText: true,
              context: context,
              controller: confirmPasswordController),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 120,
                height: 40,
                child: ElevatedButton(
                  onPressed: signUp,
                  style: style,
                  child: const Text('SIGN UP'),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => goTOLoginPage(),
                child: RichText(
                  text: const TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                        fontSize: 16,
                        color: colorLightBlack,
                        fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: colorPurple)),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void goTOLoginPage() {
    Navigator.restorablePushNamed(
      context,
      LoginPage.routeName,
    );
  }

  void goTOEmailVerificationPage() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => EmailVerificationPage(
    //       email: emailController.text,
    //       text1: 'Welcome to Inspire Investors',
    //     ),
    //   ),
    // );
  }

  void signUp() {
    if (_formKey.currentState!.validate()) {
      //goTOEmailVerificationPage();
      BlocProvider.of<SignUpBloc>(context).add(PostForSignUp(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text));
    }
  }
}
