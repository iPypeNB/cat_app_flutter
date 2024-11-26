import 'package:cat_app_flutter/features/authentication/application/bloc/temp/temp_bloc.dart';
import 'package:cat_app_flutter/features/authentication/presentation/organisms/temp_organism.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<TempBloc>(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return BlocListener<TempBloc, TempState>(
      listener: _listener,
      child: Scaffold(
        body: Column(
          children: [
            const Icon(
              Icons.abc,
              size: 80,
            ),
            TempOrganism(
              onChangePassword: (value) {
                final event = ChangePasswordEvent(newPassword: value);

                context.read<TempBloc>().add(event);
              },
              onChangeEmail: (value) {
                final event = ChangeEmailEvent(newEmail: value);

                context.read<TempBloc>().add(event);
              },
              onPressTemp: () {

              },
            ),
          ],
        ),
      ),
    );
  }

  void _listener(BuildContext context, state) {
    if (state is DataTempUpdated) {
      print(state.data.email);
      print(state.data.password);
    }
  }
}
