import 'package:flutter/material.dart';
import 'package:recipes_appv2/presentation/widgets/commons/appBarCustom.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<String> _getAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    return '${info.version}+${info.buildNumber}';
  }

  @override
  Widget build(BuildContext context) {
    //obtener app version desde pubspec.yaml

    return Scaffold(
      appBar: Appbarcustom(
          title: 'Profile', isBackButtonVisible: true, isTitleVisible: true),
      body: SafeArea(
        child: ListView(padding: const EdgeInsets.all(16.0), children: [
          Card(
            child: ProfileItem(
              title: 'User Profile',
              subtitle: 'View and edit your profile',
            ),
          ),
          Card(
            child: ProfileItem(
              title: 'Settings',
              subtitle: 'Manage your app settings',
            ),
          ),
          Card(
            child: ProfileItem(
              title: 'Privacy Policy',
              subtitle: 'Read our privacy policy',
            ),
          ),
          Card(
            child: ProfileItem(
              title: 'Terms of Service',
              subtitle: 'Read our terms of service',
            ),
          ),
            FutureBuilder<String>(
            future: _getAppVersion(),
            builder: (context, snapshot) {
              final versionText = snapshot.hasData ? snapshot.data! : '';
              return Card(
                child: ProfileItem(
                  title: 'App Version',
                  subtitle: versionText,
                ),
              );
            },
          ),
          SizedBox(height: 20),
          FutureBuilder<String>(
            future: _getAppVersion(),
            builder: (context, snapshot) {
              final versionText = snapshot.hasData ? snapshot.data! : '';
              return Text.rich(TextSpan(children: [
                TextSpan(
                  text: 'Desing created by  Ricket Gonzalez\n',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xffF95F5F),
                  ),
                ),
               
              ]));
            },
          ),
        ]),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String title;
  final String subtitle;
  const ProfileItem({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey,
        size: 20,
      ),
      title: Text(title,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xffF95F5F),
          )),
      subtitle: Text(subtitle,
          style: TextStyle(
            fontSize: 14,
          )),
    );
  }
}
