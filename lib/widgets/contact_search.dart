import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactFloatingListScreen extends StatefulWidget {
  const ContactFloatingListScreen({super.key});

  @override
  _ContactFloatingListScreenState createState() => _ContactFloatingListScreenState();
}

class _ContactFloatingListScreenState extends State<ContactFloatingListScreen> {
  List<Contact> _contacts = [];
  List<Contact> _filteredContacts = [];
  Contact? _selectedContact;
  final TextEditingController _controller = TextEditingController();
  bool _isListVisible = false;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future<void> _fetchContacts() async {
    try {
      Iterable<Contact> contacts = await ContactsService.getContacts();
      setState(() {
        _contacts = contacts.toList();
        _filteredContacts = _contacts;
      });
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching contacts: $e");
      }
    }
  }

  void _filterContacts(String query) {
    setState(() {
      _filteredContacts = _contacts
          .where((contact) => contact.displayName != null &&
              (contact.displayName!.toLowerCase().contains(query.toLowerCase()) ||
               contact.phones!.any((phone) => phone.value?.contains(query) ?? false)))
          .toList();
      _isListVisible = query.isNotEmpty && _filteredContacts.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              children: [
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'Search Contacts',
                    suffixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    _filterContacts(value);
                  },
                ),
              ],
            ),

            Positioned(
              top: 60, // Adjust this value based on your TextField height
              left: 0,
              right: 0,
              child: Visibility(
                visible: _isListVisible,
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: ListView(
                      children: _filteredContacts.map((Contact contact) {
                        return ListTile(
                          title: Text(contact.displayName ?? ''),
                          subtitle: Text('${contact.phones?.isNotEmpty ?? false ? contact.phones!.first.value : ''}'),
                          onTap: () {
                            setState(() {
                              _selectedContact = contact;
                              _controller.text = ' ${_selectedContact?.phones?.isNotEmpty ?? false ? _selectedContact!.phones!.first.value : ''}';
                              _isListVisible = false;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      );
  }
}