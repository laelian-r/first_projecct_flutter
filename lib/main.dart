import 'package:first_projecct/screens/Navigation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // debugShowCheckedModeBanner est utilisé pour supprimer le bandeau "Debug" qui apparaît en haut à droite de l'application lorsqu'elle est en mode debug.
      debugShowCheckedModeBanner: false,
      title: 'Agora Club',
      home: Navigation(),
    );
  }
}
