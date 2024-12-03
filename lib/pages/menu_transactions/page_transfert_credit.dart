import 'package:flutter/material.dart';

class PageTransfertCredit extends StatelessWidget {
  const PageTransfertCredit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          "Transfert de crédit",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
