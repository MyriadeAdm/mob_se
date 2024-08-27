import 'package:flutter/material.dart';
import 'package:mob_se/constants/reseaux.dart';
import 'package:mob_se/pages/base.dart';
import 'package:provider/provider.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(label),
            Checkbox(
              activeColor: Colors.amber,
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ConfigReseau extends StatelessWidget {
  const ConfigReseau({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8, top: 80, bottom: 10),
            child: Text(
              "Conditions d'utilisation de Mob_se",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '1. Introduction',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Bienvenue sur Mob_se. En utilisant notre application, vous acceptez les présentes conditions d’utilisation. Veuillez les lire attentivement avant de commencer à utiliser l’application.',
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '2. Accès et Utilisation',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '2.1 Accès à l’Application',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '''Mob_se est une application autonome qui ne nécessite ni la création de compte ni une connexion Internet pour fonctionner.
                        Vous pouvez accéder à toutes les fonctionnalités de l’application dès son installation.''',
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '2.2 Utilisation Acceptable',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '''Vous vous engagez à utiliser Mob_se de manière légale et respectueuse.
                        Toute utilisation abusive, frauduleuse ou non autorisée de l’application est interdite.
                        Toute utilisation abusive, frauduleuse ou non autorisée de l’application est interdite.''',
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '3. Sécurité des Données',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '3.1 Protection des Données',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '''Bien que Mob_se ne collecte pas de données personnelles, nous mettons en œuvre des mesures de sécurité pour protéger les informations locales stockées sur votre appareil.
                        Vos données sont chiffrées et stockées de manière sécurisée sur votre appareil.''',
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '3.2 Confidentialité',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '''Mob_se ne partage aucune donnée personnelle avec des tiers, car aucune donnée personnelle n’est collectée.''',
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '4. Propriété Intellectuelle',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '4.1 Contenus',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '''Tous les contenus de l’application (textes, images, logos, etc.) sont protégés par des droits d’auteur et autres droits de propriété intellectuelle.
                        Vous ne pouvez pas reproduire, distribuer ou modifier ces contenus sans autorisation préalable.''',
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('4.2 Licence d’Utilisation',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '''Nous vous accordons une licence limitée, non exclusive et non transférable pour utiliser l’application conformément à ces conditions d’utilisation.''',
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '5. Limitation de Responsabilité',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '5.1 Exclusion de Garantie',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '''Mob_se est fournie “telle quelle” sans garantie d’aucune sorte, explicite ou implicite.
                        Nous ne garantissons pas que l’application sera exempte d’erreurs ou que son fonctionnement sera ininterrompu.''',
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '5.2 Limitation des Dommages',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '''Nous ne serons pas responsables des dommages directs, indirects, accessoires, spéciaux ou consécutifs résultant de l’utilisation ou de l’incapacité à utiliser l’application.''',
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '6. Modifications des Conditions',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '''Nous nous réservons le droit de modifier ces conditions d’utilisation à tout moment.
                        Les modifications seront publiées sur cette page et vous en serez informé par une notification dans l’application. Votre utilisation continue de l’application après la publication des modifications constitue votre acceptation des nouvelles conditions.''',
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '7. Contact',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Pour toute question concernant ces conditions d’utilisation, veuillez nous contacter à l’adresse suivante : myriade@myriade-groupe.com.',
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: 200,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Column(
                                          children: [
                                            const Text(
                                                "Choisissez votre reseau :"),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 20.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Expanded(
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          context
                                                              .read<Reseaux>()
                                                              .switchToTogocom();
                                                          Navigator
                                                              .pushAndRemoveUntil(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    const Base()),
                                                            (Route<dynamic>
                                                                    route) =>
                                                                false,
                                                          );
                                                        },
                                                        child: const Text(
                                                            "Togocom")),
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Expanded(
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          context
                                                              .read<Reseaux>()
                                                              .switchToMoov();
                                                          Navigator
                                                              .pushAndRemoveUntil(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    const Base()),
                                                            (Route<dynamic>
                                                                    route) =>
                                                                false,
                                                          );
                                                        },
                                                        child:
                                                            const Text("Moov")),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const Text(
                              "J'accepte les conditions d'utilisation")),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
