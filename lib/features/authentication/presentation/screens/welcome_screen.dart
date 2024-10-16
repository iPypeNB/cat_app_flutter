import 'package:cat_app_flutter/features/authentication/application/bloc/welcome/welcome_bloc.dart';
import 'package:cat_app_flutter/features/authentication/utils/constants/authentication_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WelcomeBloc(),
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
  Color? colorButton;

  @override
  Widget build(BuildContext context) {
    return BlocListener<WelcomeBloc, WelcomeState>(
      listener: _listener,
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorButton,
          ),
          onPressed: () {
            context.read<WelcomeBloc>().add(const LoginUserEvent());
          },
          child: Text(
            AuthenticationStrings.I.login,
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, state) {
    if (state is AuthenticationSuccessState) {
      setState(() {
        colorButton = Colors.green;
      });
    }
  }
}

