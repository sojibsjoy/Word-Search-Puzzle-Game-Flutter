import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordsearchpuzzle/state_management/database/settings_item.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = '/settings';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // this variable is for changing the theme
  // bool _isDark = Get.isDarkMode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // back icon
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  SizedBox(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.filter_list),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.menu),
                          color: Colors.white,
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Row(
                children: const [
                  Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      80.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 40,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: SettingsItem().settingsItem.length,
                          itemBuilder: (context, index) {
                            return settingMenuItem(
                              icon: SettingsItem().settingsItemIcon[index],
                              title: SettingsItem().settingsItem[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget settingMenuItem({required IconData icon, required String title}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            child: Icon(
              icon,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 23,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
