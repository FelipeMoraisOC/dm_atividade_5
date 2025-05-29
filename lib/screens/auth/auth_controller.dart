import 'package:atividade4/database/local/user_dao.dart';
import 'package:atividade4/models/user_model.dart';
import 'package:atividade4/shared/utils/encrypt.dart';
import 'package:atividade4/shared/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  //função para salvar usuário em shared preferences
  Future<void> saveUserInSharedPreferences(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', user.id!);
    await prefs.setString('user_email', user.email!);
    await prefs.setString('user_phone', user.phone!);
    await prefs.setString('user_name', user.name!);
    await prefs.setString('user_password', user.password!);
    await prefs.setBool('is_logged_in', true);
  }

  //Verificar se com email já existe
  Future<bool> checkEmailExists(String email) async {
    final user = await UserDao.getUserByEmail(email);
    return user != null;
  }

  Future<void> resetPassword(context, String email, String newPassword) async {
  try {
    // Verifica se o email existe
    final userExists = await checkEmailExists(email);
    if (!userExists) {
      CustomSnackBar.show(context, 'E-mail não encontrado', fail: true);
      return;
    }

    // Atualiza a senha do usuário
    final success = await UserDao.updateUserPassword(email, newPassword);
    
    if (success) {
      CustomSnackBar.show(context, 'Senha redefinida com sucesso!');
      // Aguarda um pouco para mostrar a mensagem e depois navega para login
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushReplacementNamed(context, '/login');
      });
    } else {
      CustomSnackBar.show(context, 'Erro ao redefinir senha', fail: true);
    }
  } catch (e) {
    CustomSnackBar.show(context, 'Erro ao redefinir senha', fail: true);
  }
}

  //Login usuário
  Future<void> loginUser(context, String email, String password) async {
    final user = await UserDao.getUserByEmail(email);
    if (user == null || user.password != Encrypt.encryptPassword(password)) {
      CustomSnackBar.show(context, 'Email ou senha inválidos', fail: true);
      return;
    }
    CustomSnackBar.show(context, 'Login realizado com sucesso');
    await saveUserInSharedPreferences(user);
    Navigator.pushReplacementNamed(context, '/home', arguments: user);
  }

  //Cadastrar usuário
  Future registerUser(
    context,
    String email,
    String phone,
    String name,
    String password,
  ) async {
    try {
      final user = await UserDao.insertUser(
        UserModel(
          id: null,
          email: email,
          phone: phone,
          name: name,
          password: password,
        ),
      );
      CustomSnackBar.show(context, 'Usuário cadastrado com sucesso');
      await saveUserInSharedPreferences(user);
      Navigator.pushReplacementNamed(context, '/home', arguments: user);
    } catch (e) {
      CustomSnackBar.show(
        context,
        e.toString().replaceAll('Exception: ', ''),
        fail: true,
      );
    }
  }
}
