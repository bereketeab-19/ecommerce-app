import 'package:flutter/material.dart';
import '../Themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeMode currentMode = Provider.of<ThemeProvider>(context).themeMode;
    Brightness systemBrightness = MediaQuery.of(context).platformBrightness;

    // Determine if dark mode should be on
    bool isDarkMode =
        (currentMode == ThemeMode.system)
            ? (systemBrightness == Brightness.dark) // Use system theme
            : (currentMode == ThemeMode.dark); // Use user preference
    return Consumer<ThemeProvider>(
      builder:
          (context, themeProvider, child) => Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              title: Text(
                'Setting',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dark Mode',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Switch(
                    value: isDarkMode,
                    activeColor: Colors.white,
                    activeTrackColor: Colors.green,
                    inactiveThumbColor:
                        Theme.of(context).colorScheme.inversePrimary,
                    inactiveTrackColor: Theme.of(context).colorScheme.secondary,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (value) {
                      themeProvider.changeThemeMode();
                    },
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     themeProvider.setThemeMode(ThemeMode.system);
                  //   },
                  //   child: Text("default"),
                  // ),
                ],
              ),
            ),
          ),
    );
  }
}
