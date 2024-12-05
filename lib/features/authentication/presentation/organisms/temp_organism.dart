import 'package:flutter/material.dart';

class TempOrganism extends StatelessWidget {
  const TempOrganism({
    super.key,
    required this.onChangePassword,
    required this.onChangeEmail,
    required this.onPressTemp,
    required this.passwordValidator,
    this.passwordValidateMode = AutovalidateMode.disabled,
  });

  final Function(String)? onChangeEmail;
  final Function(String)? onChangePassword;
  final String? Function(String?)? passwordValidator;
  final VoidCallback onPressTemp;
  final AutovalidateMode passwordValidateMode;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            key: Key('temp-organism-email-field'),
            decoration: const InputDecoration(
                label: Text(
              'correo',
            )),
            onChanged: onChangeEmail,
          ),
          TextFormField(
            autovalidateMode: passwordValidateMode,
            validator: passwordValidator,
            decoration: const InputDecoration(
                label: Text(
              'password',
            )),
            onChanged: onChangePassword,
          ),
          ElevatedButton(
            onPressed: onPressTemp,
            child: const Text('Iniciar session'),
          ),
        ],
      ),
    );
  }
}
