import 'package:flutter/material.dart';

final _numeroAgentController = TextEditingController();

class PageRetrait extends StatelessWidget {
  IconButton returnBack(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  const PageRetrait({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              returnBack(context),
              const Text(
                "Retrait",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ]),
            const Divider(
              height: 30,
              indent: 50,
              endIndent: 50,
              color: Colors.black,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: SizedBox(
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _numeroAgentController,
                      decoration: InputDecoration(
                        hintText: "Numéro d'Agent",
                        filled: true,
                        fillColor: const Color.fromRGBO(230, 227, 227, 1),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _numeroAgentController.clear();
                          },
                          icon: const Icon(
                            Icons.clear,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20,),

                    const Text("Code"),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
