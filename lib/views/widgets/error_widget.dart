import 'package:flutter/material.dart';

class ErrorWidgetCustom extends StatelessWidget {
  final String message;
  const ErrorWidgetCustom({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Błąd: $message', style: const TextStyle(fontSize: 18, color: Colors.red)),
    );
  }
}
