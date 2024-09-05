import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

Contact? _contact;

class ContactFloatingList extends StatefulWidget {
  const ContactFloatingList({super.key, this.onContactSelected});

  final ValueChanged<Contact?>? onContactSelected;

  @override
  _ContactFloatingListState createState() => _ContactFloatingListState();
}

class _ContactFloatingListState extends State<ContactFloatingList> {
  List<Contact> _contacts = [];
  List<Contact> _filteredContacts = [];
  Contact? _selectedContact;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _numeroControllerFocusNode = FocusNode();
  bool _isListVisible = false;

  @override
  void initState() {
    super.initState();
    _getContactPermission();
    _fetchContacts();
  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  Future<void> _fetchContacts() async {
    try {
      List<Contact> contacts = await ContactsService.getContacts();
      setState(() {
        _contacts = contacts.toList();
        _filteredContacts = _contacts;
      });
    } catch (e) {
      print("Error fetching contacts: $e");
    }
  }

  void _filterContacts(String query) {
    setState(() {
      _filteredContacts = _contacts
          .where((contact) =>
              contact.displayName != null &&
              (contact.displayName!
                      .toLowerCase()
                      .contains(query.toLowerCase()) ||
                  contact.phones!
                      .any((phone) => phone.value?.contains(query) ?? false)))
          .toList();
      _isListVisible = query.isNotEmpty && _filteredContacts.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    focusNode: _numeroControllerFocusNode,
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
                          _controller.clear();
                          _filterContacts('');
                        },
                        icon: const Icon(
                          Icons.clear,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                    ),
                    onChanged: (value) {
                      _filterContacts(value);
                    },
                  ),
                ),
                const SizedBox(width: 8.0), // Spacing between TextField and IconButton
                IconButton(
                  icon: const Icon(Icons.contacts_rounded, color: Colors.grey, size: 40.0),
                  onPressed: () async {
                    // Demander la permission d'accéder aux contacts
                    if (await Permission.contacts.request().isGranted) {
                      // Si la permission est accordée, ouvrir le sélecteur de contacts
                      Iterable<Contact> contacts = await ContactsService.getContacts();
    
                      // Montrer une boîte de dialogue ou une page pour que l'utilisateur puisse choisir un contact
                      Contact? contact = await showDialog<Contact>(
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            title: const Text('Select a Contact'),
                            children: contacts.map((Contact contact) {
                              return SimpleDialogOption(
                                onPressed: () {
                                  Navigator.pop(context, contact);
                                },
                                child: Text(contact.displayName ?? 'No Name'),
                              );
                            }).toList(),
                          );
                        },
                      );
    
                      if (contact != null) {
                        setState(() {
                          _contact = contact;
                          String? selectedNumber = contact.phones?.isNotEmpty ?? false
                              ? contact.phones!.first.value
                              : 'Nothing selected';
                          _controller.text = selectedNumber ?? '';
                        });
                      }
                    } else {
                      // Gérer le cas où la permission est refusée
                      print("Permission to access contacts was denied.");
                    }
                  },
                ),
              ],
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
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 100,
                  maxHeight: 200,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: ListView(
                    children: _filteredContacts.map((Contact contact) {
                      return ListTile(
                        title: Text(contact.displayName ?? ''),
                        subtitle: Text(
                            '${contact.phones?.isNotEmpty ?? false ? contact.phones!.first.value : ''}'),
                        onTap: () {
                          setState(() {
                            _selectedContact = contact;
                            _controller.text =
                                ' ${_selectedContact?.phones?.isNotEmpty ?? false ? _selectedContact!.phones!.first.value : ''}';
                            _isListVisible = false;
                            if (widget.onContactSelected != null) {
                              widget.onContactSelected!(_selectedContact);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}