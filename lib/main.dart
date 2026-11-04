import 'package:first_projecct/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  // Si on utilise "runApp", il faut utiliser cet import :
  // import 'package:flutter/material.dart';
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}
