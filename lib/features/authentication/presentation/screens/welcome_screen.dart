import 'package:cat_app_flutter/features/authentication/application/bloc/welcome/welcome_bloc.dart';
import 'package:cat_app_flutter/features/authentication/presentation/organisms/auth_organisms.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance.get<WelcomeBloc>(),
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
      child: const WelcomeOrganism(),
    );
  }

  void _listener(BuildContext context, state) {
    if (state is AuthenticationSuccessState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.contentNotification),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
