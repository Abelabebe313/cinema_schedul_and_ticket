import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cinema_schedule_/widgets/language_dropdowns.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  GlobalKey<_SettingsState> _pageKey = GlobalKey<_SettingsState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Settings".tr(),
            style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins-SemiBold'),
          ),
        ),
      ),
      body: RefreshIndicator(
        key: _pageKey,
        onRefresh: () async {
          setState(() {});
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0XFFF0F0FB),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/Rectangle 432.png', //---<< profile images goes here
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Abel Abebe',
                        style: TextStyle(
                            // color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Poppins-Medium'),
                      ),
                      Text(
                        'id:24850348502',
                        style: TextStyle(
                            color: Color(0xffAFAFAF),
                            fontSize: 12,
                            fontFamily: 'Poppins-Light'),
                      ),
                    ],
                  ),
                )
              ],
            ),

            //
            //
            const SizedBox(height: 30),
            Center(
              child: Container(
                width: 350,
                height: 1,
                color: const Color(0xffAFAFAF),
              ),
            ),
            const SizedBox(height: 30),
            //
            //
            const Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Text(
                'Account',
                style: TextStyle(
                    // color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Poppins-Semibold'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xff546EE5),
                    ),
                    child: const Icon(
                      FluentSystemIcons.ic_fluent_person_accounts_regular,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  SizedBox(width: 10),
                  const Text(
                    'Personal Data',
                    style: TextStyle(
                        // color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Poppins-Medium'),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 25,
                      color: Color(0xffAFAFAF),
                    ),
                  )
                ],
              ),
            ),
            //
            //
            const SizedBox(height: 30),
            Center(
              child: Container(
                width: 350,
                height: 1,
                color: const Color(0xffAFAFAF),
              ),
            ),
            const SizedBox(height: 30),
            //
            //
            const Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Text(
                'Personal',
                style: TextStyle(
                    // color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Poppins-SemiBold'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xff54A8E5),
                    ),
                    child: const Icon(
                      FluentSystemIcons.ic_fluent_dark_theme_regular,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  SizedBox(width: 10),
                  const Text(
                    'Light Mode',
                    style: TextStyle(
                        // color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Poppins-Medium'),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      if (AdaptiveTheme.of(context).mode.isDark) {
                        AdaptiveTheme.of(context).setLight();
                      } else {
                        AdaptiveTheme.of(context).setDark();
                      }
                    },
                    icon: AdaptiveTheme.of(context).mode.isDark
                        ? Icon(
                            Icons.toggle_off,
                            size: 45,
                            color: Color(0xffAFAFAF),
                          )
                        : Icon(
                            Icons.toggle_on,
                            size: 45,
                            color: Color(0xff54A8E5),
                          ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xff54A8E5),
                    ),
                    child: const Icon(
                      FluentSystemIcons.ic_fluent_proofread_language_regular,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  SizedBox(width: 10),
                  const Text(
                    'Language',
                    style: TextStyle(
                        // color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Poppins-Medium'),
                  ),
                  Spacer(),
                  LanguageDropdown(onLanguageChanged: () {
                    _pageKey.currentState?.setState(() {});
                  }),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffE55454),
                    ),
                    child: const Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  SizedBox(width: 10),
                  const Text(
                    'Logout',
                    style: TextStyle(
                        // color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Poppins-Medium'),
                  ),
                  
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
