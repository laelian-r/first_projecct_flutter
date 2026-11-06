import 'package:first_projecct/screens/auth/Auth.dart';
import 'package:first_projecct/screens/auth/Term.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  // widgets est une liste qui contient les widgets Auth et Term. Ces widgets sont probablement des écrans ou des composants de l'application.
  List<Widget> _widgets = [];

  // currentIndex est un entier qui représente l'index actuel de l'écran affiché.
  // Il est initialisé à 0, ce qui signifie que le premier écran (Auth) sera affiché par défaut.
  int _currentIndex = 0;

  // initState est une méthode qui est appelée lorsque l'état du widget est initialisé.
  // Ici, elle est utilisée pour ajouter les widgets Auth et Term à la liste _widgets.
  @override
  void initState() {
    super.initState();

    // addAll est une méthode qui ajoute tous les éléments d'une collection à une liste.
    // Ici, elle est utilisée pour ajouter les widgets Auth et Term à la liste _widgets.
    _widgets.addAll([
      Auth(
        onChangedStep: (currentIndex) =>
            setState(() => _currentIndex = currentIndex),
      ), // Met à jour l'index actuel lorsque l'écran Auth est affiché.
      Term(
        onChangedStep: (currentIndex) =>
            setState(() => _currentIndex = currentIndex),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widgets.elementAt(
        _currentIndex,
      ), // Affiche le widget correspondant à l'index actuel.
    );
  }
}
