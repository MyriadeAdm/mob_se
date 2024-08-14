import 'package:flutter/material.dart';

class PageAchatcredit extends StatelessWidget {

  IconButton returnBack(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

const PageAchatcredit({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
              returnBack(context),
              const Text(
                "Achats d'unités",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ]
            ),
                          const Divider(
                height: 30,
                indent: 50,
                endIndent: 50,
                color: Colors.black,
                thickness: 1,
              ),
          ],
        ),
      ),
    );
  }
}