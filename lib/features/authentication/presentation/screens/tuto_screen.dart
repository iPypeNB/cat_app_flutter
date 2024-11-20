import 'package:flutter/material.dart';

class TutoScreen extends StatelessWidget {
  const TutoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 70,
            maxHeight: 150,
            minWidth: 70,
            maxWidth: 150,
          ),
          child: Container(
            height: 160,
            width: 160,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
