import 'package:atividade4/shared/utils/shared_preferences.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: const Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Usuários'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/user');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Deslogar'),
            onTap: () async {
              await SharedPreferencesUtils.clearLoginData();
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}
