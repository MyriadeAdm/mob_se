import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:mob_se/widgets/contact_search.dart';

class PageAnnulation extends StatefulWidget {
  const PageAnnulation({super.key});

  @override
  State<PageAnnulation> createState() => _PageAnnulationState();
}

class _PageAnnulationState extends State<PageAnnulation> {
  IconButton returnBack(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Annulation Page',
        style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w900,
                  ),),
        leading: returnBack(context),
      ),
      body: ContactFloatingList(
        onContactSelected: (Contact? contact) {
          // Faites quelque chose avec le contact sélectionné
          print('Selected contact: ${contact?.displayName}');
        },
      ),
    );
  }
}