import 'package:cat_app_flutter/features/authentication/application/bloc/login/login_bloc.dart';
import 'package:cat_app_flutter/features/authentication/presentation/organisms/auth_organisms.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance.get<LoginBloc>(),
      child: const Scaffold(
        body: _View(),
      ),
    );
  }
}

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<LoginBloc>().add(const AddAnalyticsContext('página Login'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context, listen: true);

    return BlocListener<LoginBloc, LoginState>(
      listener: _listener,
      child: WelcomeOrganism(
        formKey: formKey,
        onEmailChanged: (value) {
          final event = ChangeEmailEvent(value: value);
          loginBloc.add(event);
        },
        onPasswordChanged: (value) {
          final event = ChangePasswordEvent(value: value);
          loginBloc.add(event);
        },
        passwordValidateMode: AutovalidateMode.disabled,
        passwordValidator: (_) {
          return loginBloc.state.data.passwordError;
        },
        onPressLoginButton: () {},
      ),
    );
  }

  void _listener(BuildContext context, state) {
    // if (state is LoginDataUpdated) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(state.data.password),
    //       duration: const Duration(seconds: 2),
    //     ),
    //   );
    // }
  }
}
