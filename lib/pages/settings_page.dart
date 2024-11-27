import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../themes/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
            // child: SwitchListTile(
            //     title: const Text("Dark Mode"),
            //     value: Provider.of<ThemeProvider>(context, listen: false)
            //         .isDarkMode,
            //     onChanged: (value) => {
            //           Provider.of<ThemeProvider>(context, listen: false)
            //               .toggleTheme(),
            //         })

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // DarkMode
                Text(
                  "Dark mode",
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context, listen: false)
                      .isDarkMode,
                  onChanged: (value) =>
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme(),
                  activeColor: Colors.black,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
