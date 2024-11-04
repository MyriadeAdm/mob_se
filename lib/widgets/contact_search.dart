import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart' as c_service;
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart'
    as c_picker;
import 'package:mob_se/widgets/custum_bottom_sheet.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../constants/color_constants.dart';
import '../constants/reseaux.dart';

c_picker.FlutterContactPicker _contactPicker = c_picker.FlutterContactPicker();

class ContactFloatingList extends StatefulWidget {
  const ContactFloatingList(
      {super.key, this.onContactSelected, required this.controller});

  final ValueChanged<c_service.Contact?>? onContactSelected;

  final TextEditingController controller;

  @override
  // ignore: library_private_types_in_public_api
  _ContactFloatingListState createState() => _ContactFloatingListState();
}

class _ContactFloatingListState extends State<ContactFloatingList> {
  List<c_service.Contact> _contacts = [];
  List<c_service.Contact> _filteredContacts = [];
  c_service.Contact? _selectedContact;
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
      List<c_service.Contact> contacts =
          await c_service.ContactsService.getContacts();
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

  // void _filterContacts(String query) {
  //   setState(() {
  //     _filteredContacts = _contacts
  //         .where((contact) =>
  //             contact.displayName != null &&
  //             (contact.displayName!
  //                     .toLowerCase()
  //                     .contains(query.toLowerCase()) ||
  //                 contact.phones!
  //                     .any((phone) => phone.value?.contains(query) ?? false)))
  //         .toList();

  //     // Show the list only if there are matching contacts
  //     _isListVisible = query.isNotEmpty && _filteredContacts.isNotEmpty;
  //   });
  // }

  void _filterContacts(String query) {
    setState(() {
      // Filtrer d'abord les contacts dont le nom commence par les premières lettres du query
      List<c_service.Contact> startsWithQuery = _contacts.where((contact) {
        final displayName = contact.displayName?.toLowerCase() ?? '';
        return displayName.startsWith(query.toLowerCase());
      }).toList();

      // Ensuite, filtrer les contacts qui contiennent le query dans leur nom ou leur numéro
      List<c_service.Contact> containsQuery = _contacts.where((contact) {
        final displayName = contact.displayName?.toLowerCase() ?? '';
        final phoneMatches = contact.phones?.any((phone) {
              return phone.value?.contains(query) ?? false;
            }) ??
            false;

        // S'assurer que ce contact n'a pas déjà été ajouté dans startsWithQuery
        return !displayName.startsWith(query.toLowerCase()) &&
            (displayName.contains(query.toLowerCase()) || phoneMatches);
      }).toList();

      // Combine both lists: those starting with the query first, then the rest
      _filteredContacts = [...startsWithQuery, ...containsQuery];

      // Afficher la liste seulement s'il y a des contacts correspondants
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
                    controller: widget.controller,
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
                          widget.controller.clear();
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
                        borderSide: BorderSide(
                          color: (context.watch<Reseaux>().reseau == "Togocom")
                              ? ColorConstants.colorCustomButton2
                              : ColorConstants.colorCustomButtonMv,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      _filterContacts(value);

                      // If there are no matching contacts, hide the list
                      if (_filteredContacts.isEmpty) {
                        setState(() {
                          _isListVisible = false;
                          _selectedContact = null;
                          widget.controller.text = value;
                          // No contact matches, user input is treated as a phone number
                        });
                      }
                    },
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.contacts_rounded,
                      color: Colors.grey, size: 40.0),
                  onPressed: () async {
                    c_picker.Contact? contact =
                        await _contactPicker.selectContact();
                    if (contact != null) {
                      setState(() {
                        List<String>? phoneNumbers = contact.phoneNumbers;
                        selectedNumber = phoneNumbers?[0] ?? 'Nothing selected';
                        widget.controller.text = selectedNumber!;
                      });
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
                    children:
                        _filteredContacts.map((c_service.Contact contact) {
                      return ListTile(
                        title: Text(contact.displayName ?? ''),
                        subtitle: Text(
                            '${contact.phones?.isNotEmpty ?? false ? contact.phones!.first.value : ''}'),
                        onTap: () {
                          setState(() {
                            _selectedContact = contact;
                            widget.controller.text =
                                '${_selectedContact?.phones?.isNotEmpty ?? false ? _selectedContact!.phones!.first.value : ''}';
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
