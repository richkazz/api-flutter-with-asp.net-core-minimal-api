import 'package:api_tempate_flutter/src/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../util/input_validation.dart';
import '../../../../../widgets/text_field.dart';
import '../bloc/login_bloc.dart';

class SignUpControl extends StatefulWidget {
  const SignUpControl({Key? key}) : super(key: key);

  @override
  State<SignUpControl> createState() => _SignUpControlState();
}

class _SignUpControlState extends State<SignUpControl> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isNotifyLoading = false;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 16),
        backgroundColor: const Color.fromARGB(255, 170, 55, 231));
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          textField(
              validator: InputValidator.nameValidator,
              keyboard: TextInputType.text,
              hintText: 'User Name',
              labelText: 'User Name',
              context: context,
              controller: emailController),
          const SizedBox(height: 15),
          textField(
              validator: InputValidator.passwordValidator,
              keyboard: TextInputType.text,
              hintText: 'Password',
              context: context,
              labelText: 'Password',
              obscureText: true,
              controller: passwordController),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: goTOForgetPasswordPage,
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 52, 64, 84)),
                ),
              )
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 120,
                height: 40,
                child: ElevatedButton(
                  onPressed: loginMethod,
                  style: style,
                  child: const Text('Login'),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => goTOSignUpPage(),
                child: RichText(
                  text: const TextSpan(
                    text: "Don’t have an account? ",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 52, 64, 84),
                        fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Sign up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 170, 55, 231))),
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

  void goTOForgetPasswordPage() {
    ///TODO
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const LoginPage(),
      ),
    );
  }

  void loginMethod() async {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<LoginBloc>(context).add(PostLoginEvent(
          email: emailController.text, password: passwordController.text));
    }
  }

  void goTOSignUpPage() {
    Navigator.pop(context);
  }
}
