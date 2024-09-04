import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/color_constants.dart';
import '../../constants/reseaux.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(label),
            Checkbox(
              activeColor: (context.watch<Reseaux>().reseau == "Togocom")
                  ? ColorConstants.colorCustomButtonTg
                  : ColorConstants.colorCustomButtonMv,
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              },
            ),
          ],
        ),
      ),
    );
  }
}

List<String> options = ['MM', 'AUTRUI'];

bool? isChecked = false;
final _numeroController = TextEditingController();
final FocusNode _numeroControllerFocusNode = FocusNode();
int montant = 0;

String currentOption = options[0];
bool codeVisible = false;
bool numVisible = false;

class PageAnnulation extends StatefulWidget {
  const PageAnnulation({super.key});

  @override
  State<PageAnnulation> createState() => _PageAnnulationState();
}

class _PageAnnulationState extends State<PageAnnulation> {
  final List<Contact> _contacts = [];
  List<Contact> _filteredContacts = [];
  Contact? _selectedContact;
  final TextEditingController _controller = TextEditingController();
  bool _isListVisible = false;

  IconButton returnBack(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
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

  String num = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: ListTile(
                          horizontalTitleGap: 0,
                          title: const Text(
                            'Dernière Transaction',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          leading: Radio(
                            value: options[0],
                            groupValue: currentOption,
                            onChanged: (value) {
                              setState(() {
                                currentOption = value.toString();
                                numVisible = false;
                                _numeroController.clear();
                              });
                            },
                            activeColor:
                                (context.watch<Reseaux>().reseau == "Togocom")
                                    ? ColorConstants.colorCustomButton2
                                    : ColorConstants.colorCustomButtonMv,
                          ))),
                  Expanded(
                      child: ListTile(
                          horizontalTitleGap: 0,
                          title: const Text(
                            'Autre',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          leading: Radio(
                            value: options[1],
                            groupValue: currentOption,
                            onChanged: (value) {
                              setState(() {
                                currentOption = value.toString();
                                numVisible = !numVisible;
                              });
                            },
                            activeColor:
                                (context.watch<Reseaux>().reseau == "Togocom")
                                    ? ColorConstants.colorCustomButton2
                                    : ColorConstants.colorCustomButtonMv,
                          ))),
                ],
              ),
              Visibility(
                visible: numVisible,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        controller: _numeroController,
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
                  ],
                ),
              ),

              //=========================================================
              Padding(
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
                      top:
                          60, // Adjust this value based on your TextField height
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
                              children:
                                  _filteredContacts.map((Contact contact) {
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
