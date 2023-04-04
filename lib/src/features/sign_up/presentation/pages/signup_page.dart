import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widgets/notify_indicator.dart';
import '../../../../../widgets/top_display.dart';
import '../../../login/presentation/pages/login_page.dart';
import '../../signup_injection_container.dart';
import '../bloc/bloc.dart';
import '../widgets/widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  static const routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  BlocProvider<SignUpBloc> buildBody(BuildContext context) {
    void goTOLoginPage() {
      Navigator.restorablePushNamed(
        context,
        LoginPage.routeName,
      );
    }

    return BlocProvider(
      create: (_) => sl<SignUpBloc>(),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  // Top half
                  const TopHalfDisplay(
                    text1: "Welcome to Inspire Investors",
                    text2: "Create a new account",
                  ),
                  const SizedBox(height: 35),
                  // Bottom half
                  const SignUpControl(),
                ],
              ),
            ),
          ),
          BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              if (state is Empty) {
                return Container();
              } else if (state is Loading) {
                return Notify.loading1(context);
              } else if (state is Loaded) {
                void successFunction() => goTOLoginPage();
                return Notify.success1(context, state.message, successFunction);
              } else if (state is Error) {
                void errorFunction() =>
                    BlocProvider.of<SignUpBloc>(context).add(EmptyEvent());
                return Notify.error(context, state.message, errorFunction);
              } else {
                return Container();
              }
              // We're going to also check for the other states
            },
          )
        ],
      ),
    );
  }
}
