import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widgets/widgets.dart';
import '../../login_injection_container.dart';
import '../bloc/login_bloc.dart';
import '../widgets/login_control.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<LoginBloc> buildBody(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<LoginBloc>(),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  // Top half
                  const TopHalfDisplay(
                    text1: "Welcome to Inspire Investors",
                    text2: "Login to your account",
                  ),

                  const SizedBox(height: 35),
                  // Bottom half
                  const SignUpControl(),
                ],
              ),
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is Empty) {
                  return Container();
                } else if (state is Loading) {
                  return Notify.loading1(context);
                } else if (state is Loaded) {
                  void successFunction() {}
                  return Notify.success1(
                      context, state.message, successFunction);
                } else if (state is Error) {
                  void errorFunction() =>
                      context.read<LoginBloc>().add(EmptyEvent());
                  return Notify.error(context, state.message, errorFunction);
                } else {
                  return Container();
                }
                // We're going to also check for the other states
              },
            ),
          ],
        ));
  }
}
