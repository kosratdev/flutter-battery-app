import 'package:flutter/material.dart';

class LabelTitle extends StatelessWidget {
  const LabelTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}
