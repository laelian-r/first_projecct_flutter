import 'package:flutter/material.dart';

class Term extends StatefulWidget {
  // onChangedStep est une fonction qui prend un entier en paramètre et ne retourne rien.
  // Elle est utilisée pour notifier le parent (Navigation) lorsque l'utilisateur passe à l'étape suivante (Term).
  // Quand l'utilisateur clique sur le bouton "Continue", on appelle widget.onChangedStep(1) pour notifier le parent que l'utilisateur a terminé l'étape Auth et qu'il peut passer à l'étape Term.
  final ValueChanged<int> onChangedStep;

  // Le constructeur de la classe Term prend en paramètre une fonction onChangedStep et l'initialise.
  // Le mot-clé required est utilisé pour indiquer que ce paramètre est obligatoire.
  const Term({super.key, required this.onChangedStep});

  @override
  State<Term> createState() => _TermState();
}

class _TermState extends State<Term> {
  // ScrollController est utilisé pour contrôler le défilement du SingleChildScrollView.
  // Il permet de détecter quand l'utilisateur a atteint le bas du texte des conditions générales.
  late final ScrollController _scrollController;

  // Variable pour suivre si l'utilisateur a lu les conditions générales
  bool _termsReaded = false;

  // initState est une méthode qui est appelée lorsque l'état du widget est initialisé.
  // Ici, elle est utilisée pour configurer le ScrollController et ajouter un écouteur pour détecter le défilement.
  @override
  void initState() {
    // super.initState() est appelé pour s'assurer que l'initialisation de l'état du widget parent est effectuée correctement.
    super.initState();
    // _scrollController est initialisé avec un nouveau ScrollController.
    _scrollController = ScrollController();

    // Un écouteur est ajouté au ScrollController pour détecter le défilement.
    _scrollController.addListener(() {
      // Si l'utilisateur a atteint le bas du texte des conditions générales, la variable _termsReaded est mise à jour pour indiquer que les conditions ont été lues.
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() => _termsReaded = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => widget.onChangedStep(0),
          ), // Retour à l'écran Auth
          title: const Text('Terms & Conditions'),
        ),

        body: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,

                  physics: AlwaysScrollableScrollPhysics(),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Text('''CONDITIONS GÉNÉRALES D’UTILISATION
Dernière mise à jour : [date]

1. À PROPOS D’AGORA CLUB

Agora Club est une application destinée à permettre à ses utilisateurs de partager des connaissances et d’échanger avec d’autres membres. L’application est éditée par [nom légal de l’éditeur], dont le siège est situé à [adresse], joignable à [adresse e-mail de contact].

Dans les présentes conditions, « nous » désigne l’éditeur d’Agora Club et « vous » désigne toute personne qui accède à l’application ou l’utilise.

2. ACCEPTATION DES CONDITIONS

En créant un compte ou en utilisant Agora Club, vous reconnaissez avoir lu et accepté les présentes conditions. Si vous ne les acceptez pas, veuillez ne pas utiliser l’application.

Si vous utilisez l’application pour le compte d’une organisation, vous déclarez être autorisé à accepter ces conditions en son nom.

3. CONDITIONS D’ACCÈS ET COMPTE

Vous devez fournir des informations exactes et les maintenir à jour. Vous êtes responsable de la confidentialité de vos identifiants et de toute activité réalisée depuis votre compte. Informez-nous sans délai si vous pensez que votre compte a été utilisé sans autorisation.

Vous ne pouvez pas créer un compte en usurpant l’identité d’une autre personne, ni utiliser le compte d’un tiers sans son autorisation. Nous pouvons demander la correction d’informations inexactes ou limiter l’accès à un compte lorsque cela est nécessaire à la sécurité du service.

4. UTILISATION DE L’APPLICATION

Vous vous engagez à utiliser Agora Club conformément à la loi et aux présentes conditions. Il vous est notamment interdit de :

• publier des contenus illégaux, menaçants, frauduleux, discriminatoires ou portant atteinte aux droits d’autrui ;
• harceler, intimider, tromper ou usurper l’identité d’une personne ;
• publier des informations personnelles concernant une autre personne sans autorisation ;
• diffuser des virus, perturber le fonctionnement de l’application ou tenter d’accéder sans autorisation à ses systèmes ;
• utiliser l’application pour envoyer des communications non sollicitées ou réaliser une activité frauduleuse.

Vous êtes responsable de vos interactions avec les autres utilisateurs. En cas de problème, vous pouvez nous contacter à [adresse e-mail de contact].

5. CONTENUS PUBLIÉS PAR LES UTILISATEURS

Vous conservez les droits que vous détenez sur les textes, images et autres contenus que vous publiez (« vos contenus »). Vous êtes responsable de vos contenus et garantissez disposer des droits et autorisations nécessaires à leur publication.

En publiant un contenu, vous nous accordez une autorisation non exclusive, gratuite et mondiale de l’héberger, le stocker, le reproduire et l’afficher dans la mesure nécessaire au fonctionnement, à la sécurité et à la promotion d’Agora Club. Cette autorisation prend fin lorsque le contenu est supprimé, sous réserve des copies techniques temporaires, des obligations légales et des sauvegardes effectuées dans le cours normal de nos activités.

Ne publiez pas de contenu confidentiel ou de données personnelles que vous ne souhaitez pas partager. Les contenus publiés peuvent être visibles par d’autres utilisateurs selon les fonctionnalités et paramètres de l’application.

6. MODÉRATION ET SIGNALEMENT

Nous pouvons examiner les contenus ou comportements signalés et prendre les mesures que nous estimons appropriées, notamment retirer un contenu ou restreindre ou suspendre un compte. Nous nous réservons également le droit de supprimer tout contenu qui enfreint les présentes conditions ou la loi.

Pour signaler un contenu ou un comportement, contactez-nous à [adresse e-mail de signalement]. Dans la mesure du possible, indiquez le contenu concerné et la raison du signalement.

7. PROPRIÉTÉ INTELLECTUELLE

L’application, son nom, son interface, ses éléments graphiques et ses logiciels sont protégés par les droits de propriété intellectuelle applicables. Sauf autorisation écrite, vous ne pouvez pas les copier, modifier, distribuer ou exploiter au-delà de ce qui est nécessaire à l’utilisation normale de l’application.

Aucun élément des présentes conditions ne vous transfère la propriété de ces droits.

8. DISPONIBILITÉ ET ÉVOLUTIONS DU SERVICE

Nous cherchons à maintenir Agora Club disponible et sécurisé, sans garantir un accès continu ou sans erreur. L’application peut être temporairement indisponible pour maintenance, mise à jour ou en raison d’événements indépendants de notre volonté.

Nous pouvons modifier, suspendre ou arrêter certaines fonctionnalités. Lorsque la loi l’exige, nous vous informerons des changements importants.

9. LIENS ET SERVICES TIERS

L’application peut contenir des liens ou utiliser des services fournis par des tiers. Ces services sont soumis à leurs propres conditions et politiques. Nous ne sommes pas responsables de leur contenu ni de leur disponibilité, sauf disposition légale contraire.

10. DONNÉES PERSONNELLES

Le traitement de vos données personnelles est décrit dans notre politique de confidentialité, disponible à [lien vers la politique de confidentialité]. Elle précise notamment les données collectées, les finalités du traitement, les durées de conservation et les moyens d’exercer vos droits.

11. SUSPENSION ET SUPPRESSION DU COMPTE

Vous pouvez cesser d’utiliser l’application et demander la suppression de votre compte en contactant [adresse e-mail ou procédure de suppression].

Nous pouvons suspendre ou résilier votre accès si vous enfreignez les présentes conditions, si la loi l’exige ou si cela est nécessaire pour protéger les utilisateurs, l’application ou nos droits. Lorsque cela est raisonnablement possible, nous vous informerons du motif de cette mesure.

Les dispositions qui, par leur nature, doivent continuer à s’appliquer après la fermeture d’un compte restent en vigueur, notamment celles relatives aux contenus déjà partagés, à la propriété intellectuelle et à la responsabilité.

12. RESPONSABILITÉ

Agora Club est fourni dans les limites autorisées par la loi applicable. Nous ne garantissons pas que les informations publiées par les utilisateurs soient exactes, complètes ou à jour. Vous devez évaluer ces informations avant de vous y fier.

Dans les limites autorisées par la loi, nous ne sommes pas responsables des dommages indirects résultant de l’utilisation ou de l’impossibilité d’utiliser l’application. Aucune disposition des présentes conditions n’exclut une responsabilité qui ne peut légalement être exclue, notamment en cas de faute intentionnelle ou lorsque la loi l’interdit.

13. MODIFICATIONS DES CONDITIONS

Nous pouvons mettre à jour ces conditions. La date de dernière mise à jour figure en haut du document. En cas de modification importante, nous vous en informerons par un moyen approprié. La poursuite de l’utilisation de l’application après l’entrée en vigueur des nouvelles conditions vaut acceptation de celles-ci, dans la mesure permise par la loi.

14. DROIT APPLICABLE ET CONTACT

Les présentes conditions sont régies par le droit de [pays ou juridiction], sous réserve des règles impératives applicables dans votre pays de résidence. Tout litige sera traité par les juridictions compétentes conformément à la loi applicable.

Pour toute question concernant ces conditions, contactez-nous à :
contact@agoraclub.fr
06 70 08 90 01
45 rue de la République, 75001 Paris, France'''),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),

                // Le bouton est désactivé si l'utilisateur n'a pas lu les conditions générales.
                // Si l'utilisateur a lu les conditions, le bouton est activé et affiche un message dans la console lorsqu'il est pressé.
                onPressed: !_termsReaded ? null : () => print('Accept'),

                child: Text(
                  'accept & continue'.toUpperCase(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
