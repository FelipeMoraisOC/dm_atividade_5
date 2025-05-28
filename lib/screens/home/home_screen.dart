import 'package:atividade4/shared/utils/shared_preferences.dart';
import 'package:atividade4/shared/widgets/custom_appbar.dart';
import 'package:atividade4/shared/widgets/custom_card.dart';
import 'package:atividade4/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreferencesUtils sharedPreferencesUtils = SharedPreferencesUtils();
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<Map<String, String?>>(
            future: sharedPreferencesUtils.getUserInfoFromPrefs(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError ||
                  snapshot.data == null ||
                  snapshot.data!.isEmpty) {
                return Card(
                  child: ListTile(
                    title: Text('Nenhum dado salvo no SharedPreferences'),
                  ),
                );
              }
              final data = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(child: Text(data['id'] ?? '')),
                    title: Text('Nome: ${data['name'] ?? ''}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email: ${data['email'] ?? ''}'),
                        Text('Telefone: ${data['phone'] ?? ''}'),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 16),
          const Center(
            child: Text(
              'Bem-vindo ao app da Atividade 5',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomCard(
                    titulo: 'Card 1',
                    descricao: 'Descrição do Card 1',
                    estrelas: 5,
                  ),
                  CustomCard(
                    titulo: 'Card 2',
                    descricao: 'Descrição do Card 2',
                    estrelas: 3,
                  ),
                  CustomCard(
                    titulo: 'Card 3',
                    descricao: 'Descrição do Card 3',
                    estrelas: 4,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
