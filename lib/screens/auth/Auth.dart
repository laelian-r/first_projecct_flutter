import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  // onChangedStep est une fonction qui prend un entier en paramètre et ne retourne rien.
  // Elle est utilisée pour notifier le parent (Navigation) lorsque l'utilisateur passe à l'étape suivante (Term).
  // Quand l'utilisateur clique sur le bouton "Continue", on appelle widget.onChangedStep(1) pour notifier le parent que l'utilisateur a terminé l'étape Auth et qu'il peut passer à l'étape Term.
  final ValueChanged<int> onChangedStep;

  // Le constructeur de la classe Auth prend en paramètre une fonction onChangedStep et l'initialise.
  // Le mot-clé required est utilisé pour indiquer que ce paramètre est obligatoire.
  const Auth({super.key, required this.onChangedStep});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  // GlobalKey<FormState> est utilisé pour valider le formulaire. Il est initialisé en haut de la classe _AuthState et est passé en paramètre au widget Form. Quand l'utilisateur clique sur le bouton "Continue", on peut utiliser _formKey.currentState.validate() pour vérifier si tous les champs du formulaire sont valides.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // RegExp est utilisé pour vérifier si l'email et le mot de passe saisis par l'utilisateur sont valides. L'expression régulière pour l'email vérifie si l'email est au format "email@domaine.extension"
  final RegExp _emailRegex = RegExp(r'^[\w.+-]+@([\w-]+\.)+[\w-]{2,}$');

  // L'expression régulière pour le mot de passe vérifie si le mot de passe contient au moins 8 caractères, au moins une lettre et au moins un chiffre. Elle ne vérifie pas la présence de caractères spéciaux.
  final RegExp _passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{8,}$');
  // _email et _password sont des variables qui stockent les valeurs saisies dans les champs de texte. Elles sont initialisées à des chaînes vides et sont mises à jour à chaque fois que l'utilisateur saisit quelque chose dans les champs de texte.
  String _email = '';
  String _password = '';

  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          title: const Text('Agora Club'),
        ),

        body: Center(
          // SingleChildScrollView est utilisé pour permettre le défilement du contenu si celui-ci dépasse la taille de l'écran.
          // Exemple : actuellement, tous les éléments du SingleChildScrollView sont affichés sur le centre de l'écran, mais si on ouvre le clavier, le contenu dépasse la taille de l'écran et on ne peut plus voir tous les éléments. Le SingleChildScrollView permet de faire défiler le contenu pour voir tous les éléments.
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              // Quand on uilise un Column, il faut mettre les enfants dans un tableau children.
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Everyone has\n'.toUpperCase(),
                    style: TextStyle(color: Colors.black, fontSize: 30),

                    children: [
                      TextSpan(
                        text: 'knowledge\n'.toUpperCase(),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      TextSpan(text: 'to share.'.toUpperCase()),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  'It all starts here.',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),

                SizedBox(height: 50),

                Form(
                  // _formKey est utilisé pour valider le formulaire. Il est initialisé en haut de la classe _AuthState et est passé en paramètre au widget Form. Quand l'utilisateur clique sur le bouton "Continue", on peut utiliser _formKey.currentState.validate() pour vérifier si tous les champs du formulaire sont valides.
                  key: _formKey,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,

                    children: [
                      Text('Enter your email'),

                      SizedBox(height: 10),

                      TextFormField(
                        // _email est une variable qui stocke la valeur saisie dans le champ de texte.
                        // onChanged est utilisé pour mettre à jour la valeur de _email à chaque fois que l'utilisateur saisit quelque chose dans le champ de texte.
                        onChanged: (value) => setState(() => _email = value),

                        // validator est utilisé pour vérifier si l'email saisi par l'utilisateur est valide.
                        // Si l'email est vide ou ne correspond pas à l'expression régulière, un message d'erreur est affiché.
                        validator: (value) =>
                            value!.isEmpty || !_emailRegex.hasMatch(value)
                            ? 'Please enter a valid email'
                            : null,

                        decoration: InputDecoration(
                          hintText: 'john.doe@example.com',

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      Text('Enter your password'),

                      SizedBox(height: 10),

                      TextFormField(
                        // _password est une variable qui stocke la valeur saisie dans le champ de texte.
                        // onChanged est utilisé pour mettre à jour la valeur de _password à chaque fois que l'utilisateur saisit quelque chose dans le champ de texte.
                        onChanged: (value) => setState(() => _password = value),

                        // validator est utilisé pour vérifier si le mot de passe saisi par l'utilisateur est valide.
                        // Si le mot de passe est vide ou ne correspond pas à l'expression régulière, un message d'erreur est affiché.
                        validator: (value) =>
                            value!.isEmpty || !_passwordRegex.hasMatch(value)
                            ? 'Please enter a valid password'
                            : null,

                        // obscureText est utilisé pour masquer le texte saisi dans le champ de mot de passe. Quand il est à true, le texte saisi est remplacé par des points. Quand il est à false, le texte saisi est affiché normalement.
                        // _isPasswordVisible est une variable booléenne qui est initialisée à true. Quand l'utilisateur clique sur l'icône de l'œil, la valeur de _isPasswordVisible est inversée (true devient false et false devient true). Ainsi, quand _isPasswordVisible est true, le texte saisi est masqué et quand il est false, le texte saisi est affiché normalement.
                        // On créé la variable _isPasswordVisible en haut de la classe _AuthState pour pouvoir l'utiliser dans le build et dans le onPressed de l'icône de l'œil.
                        obscureText: _isPasswordVisible,

                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => _isPasswordVisible = !_isPasswordVisible,
                            ),
                            child: Icon(
                              !_isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),

                          hintText: '••••••••••',

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          elevation: 0,
                          backgroundColor: Theme.of(context).primaryColor,
                        ),

                        onPressed:
                            !_emailRegex.hasMatch(_email) ||
                                !_passwordRegex.hasMatch(_password)
                            ? null
                            : () {
                                // _formKey.currentState!.validate() est utilisé pour vérifier si tous les champs du formulaire sont valides.
                                // Si tous les champs sont valides, la fonction retourne true, sinon elle retourne false.
                                // On peut utiliser cette fonction pour envoyer les données à l'API ou à la base de données seulement si le formulaire est valide.
                                if (_formKey.currentState!.validate()) {
                                  print('Email: $_email');
                                  print('Password: $_password');

                                  widget.onChangedStep(1); // Notifie le parent (Navigation) que l'utilisateur a terminé l'étape Auth et qu'il peut passer à l'étape Term.
                                }
                              },

                        child: Text(
                          'Continue'.toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
