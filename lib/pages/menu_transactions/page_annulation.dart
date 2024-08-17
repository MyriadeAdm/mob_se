import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

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

  List<Contact> _contacts = [];

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future<void> _fetchContacts() async {
    if (await Permission.contacts.request().isGranted) {
      Iterable<Contact> contacts = await ContactsService.getContacts();
      setState(() {
        _contacts = contacts.toList();
      });
    }
  }

  String num = '';

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
                "Annulation",
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
            SizedBox(
              height: 500,
              //width: MediaQuery.sizeOf(context),
              child: _contacts.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: _contacts.length,
                      itemBuilder: (context, index) {
                        Contact contact = _contacts[index];
                        if (contact.phones == []) {
                          num = 'No phone number';
                        } else {
                          num = contact.phones.toString();
                        }
                        return ListTile(
                          title: Text(contact.displayName ?? ''),
                          subtitle: Text(
                            num,
                            //contact.phones.isNotEmpty ? contact.phones.first.value : 'No phone number',
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
