import 'package:flutter/material.dart';
import 'package:newsapp/core/theme/colors.dart';
import 'package:newsapp/feature/settings/view/languages_view.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool themeModeEnabled = false;
  bool notificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsList(
        backgroundColor: AppColor.lightGrey,
        contentPadding: const EdgeInsets.only(
          top: 10,
        ),
        sections: [
          SettingsSection(
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: const Icon(Icons.language),
                onPressed: (context) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const LanguagesView(),
                  ));
                },
              ),
              SettingsTile.switchTile(
                title: 'Theme',
                leading: themeModeEnabled
                    ? const Icon(Icons.dark_mode)
                    : const Icon(Icons.light_mode),
                switchValue: themeModeEnabled,
                onToggle: (bool value) {
                  setState(() {
                    themeModeEnabled = value;
                  });
                },
              ),
              SettingsTile.switchTile(
                title: 'Enable Notifications',
                leading: const Icon(Icons.notifications_active),
                switchValue: notificationsEnabled,
                onToggle: (value) {
                  setState(() {
                    notificationsEnabled = value;
                  });
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'Misc',
            tiles: const [
              SettingsTile(
                  title: 'Terms of Service', leading: Icon(Icons.description)),
              SettingsTile(
                  title: 'Open source licenses',
                  leading: Icon(Icons.collections_bookmark)),
            ],
          ),
          CustomSection(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 22, bottom: 8),
                  child: Image.asset(
                    'assets/images/settings.png',
                    height: 50,
                    width: 50,
                    color: AppColor.erieBlack2,
                  ),
                ),
                const Text(
                  'Version: 1.0.0',
                  style: TextStyle(color: AppColor.erieBlack2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
