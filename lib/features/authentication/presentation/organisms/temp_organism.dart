import 'package:flutter/material.dart';

class TempOrganism extends StatelessWidget {
  const TempOrganism({
    super.key,
    required this.onChangePassword,
    required this.onChangeEmail,
    required this.onPressTemp,
  });

  final Function(String)? onChangeEmail;
  final Function(String)? onChangePassword;
  final VoidCallback onPressTemp;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                label: Text(
              'correo',
            )),
            onChanged: onChangeEmail,
          ),
          TextFormField(
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
