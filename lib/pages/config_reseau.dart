import 'package:flutter/material.dart';
import 'package:mob_se/constants/reseaux.dart';
import 'package:mob_se/pages/base.dart';
import 'package:provider/provider.dart';

class ConfigReseau extends StatelessWidget {
  const ConfigReseau({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Expanded(
              child: Text(""" Conditions d’utilisation de Mob_se

1. Introduction

Bienvenue sur Mob_se. En utilisant notre application, vous acceptez les présentes conditions d’utilisation. Veuillez les lire attentivement avant de commencer à utiliser l’application.

2. Accès et Utilisation

2.1 Accès à l’Application

Mob_se est une application autonome qui ne nécessite ni la création de compte ni une connexion Internet pour fonctionner.
Vous pouvez accéder à toutes les fonctionnalités de l’application dès son installation.
2.2 Utilisation Acceptable

Vous vous engagez à utiliser Mob_se de manière légale et respectueuse.
Toute utilisation abusive, frauduleuse ou non autorisée de l’application est interdite.
3. Sécurité des Données

3.1 Protection des Données

Bien que Mob_se ne collecte pas de données personnelles, nous mettons en œuvre des mesures de sécurité pour protéger les informations locales stockées sur votre appareil.
Vos données sont chiffrées et stockées de manière sécurisée sur votre appareil.
3.2 Confidentialité

Mob_se ne partage aucune donnée personnelle avec des tiers, car aucune donnée personnelle n’est collectée.
4. Propriété Intellectuelle

4.1 Contenus

Tous les contenus de l’application (textes, images, logos, etc.) sont protégés par des droits d’auteur et autres droits de propriété intellectuelle.
Vous ne pouvez pas reproduire, distribuer ou modifier ces contenus sans autorisation préalable.
4.2 Licence d’Utilisation

Nous vous accordons une licence limitée, non exclusive et non transférable pour utiliser l’application conformément à ces conditions d’utilisation.
5. Limitation de Responsabilité

5.1 Exclusion de Garantie

Mob_se est fournie “telle quelle” sans garantie d’aucune sorte, explicite ou implicite.
Nous ne garantissons pas que l’application sera exempte d’erreurs ou que son fonctionnement sera ininterrompu.
5.2 Limitation des Dommages

Nous ne serons pas responsables des dommages directs, indirects, accessoires, spéciaux ou consécutifs résultant de l’utilisation ou de l’incapacité à utiliser l’application.
6. Modifications des Conditions

Nous nous réservons le droit de modifier ces conditions d’utilisation à tout moment.
Les modifications seront publiées sur cette page et vous en serez informé par une notification dans l’application. Votre utilisation continue de l’application après la publication des modifications constitue votre acceptation des nouvelles conditions.
7. Résiliation

Nous nous réservons le droit de suspendre ou de résilier votre accès à l’application à tout moment, sans préavis, en cas de violation de ces conditions d’utilisation.
8. Contact

Pour toute question concernant ces conditions d’utilisation, veuillez nous contacter à l’adresse suivante : myriade@myriade-groupe.com."""),
            ),
            const Text("Choix du reseau :"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<Reseaux>().switchToTogocom();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const Base()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: const Text("Togocom")),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<Reseaux>().switchToMoov();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const Base()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: const Text("Moov")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
