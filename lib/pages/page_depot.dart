import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';

bool? isChecked = false;
final _numeroController = TextEditingController();
final FocusNode _numeroControllerFocusNode = FocusNode();


final FlutterContactPicker _contactPicker = FlutterContactPicker();
// ignore: unused_element
Contact? _contact;
String? selectedNumber;

class PageDepot extends StatelessWidget {
  IconButton returnBack(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  const PageDepot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(children: [
                returnBack(context),
                const Text(
                  "Dépot",
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
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          autofocus: true,
                          controller: _numeroController,
                          decoration: InputDecoration(
                            hintText: 'Nom ou numéro de téléphone',
                            filled: true,
                            fillColor: const Color.fromRGBO(230, 227, 227, 1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                _numeroController.clear();
                              },
                              icon: const Icon(
                                Icons.clear,
                                size: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.contacts_rounded,
                            color: Colors.grey, size: 40.0),
                        onPressed: () async {
                          // setState(() {
                          //   // click += 1;
                          // });

                          // Contact? contact = await _contactPicker.selectContact();
                          //   if (contact != null) {
                          //     setState(() {
                          //       _contact = contact;
                          //       List<String>? phoneNumbers = contact.phoneNumbers;
                          //       selectedNumber = phoneNumbers?[0] ?? 'Nothing selected';
                          //       _numeroController.text = selectedNumber!;
                          //     });
                          //   }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextField(
                        autofocus: true,
                        controller: _numeroController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const Text(
                        'F CFA',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
