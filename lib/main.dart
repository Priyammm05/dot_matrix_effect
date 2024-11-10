import 'package:dot_matrix_effect/dot_matrix/matrix_effect.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Root app widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MatrixEffect(),
    );
  }
}