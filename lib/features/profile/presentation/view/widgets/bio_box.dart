import 'package:flutter/material.dart';

class BioBox extends StatelessWidget {
  const BioBox({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
      width: double.infinity,
      child: Text(
        text.isNotEmpty ? text : 'Empty Bio...',
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
      ),
    );
  }
}
