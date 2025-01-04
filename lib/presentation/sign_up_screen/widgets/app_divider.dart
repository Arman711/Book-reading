import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 5,
          child: Divider(),
        ),
        Expanded(
          flex: 2,
          child: Text(
            'Or',
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 5,
          child: Divider(),
        ),
      ],
    );
  }
}
