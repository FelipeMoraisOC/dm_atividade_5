import 'package:atividade4/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'auth_controller.dart';
import 'widgets/login_text_form_field.dart';
import '../../shared/utils/validators.dart';
import '../../shared/constants/constants.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirme a nova senha';
    } else if (value != _newPasswordController.text) {
      return 'As senhas não coincidem';
    }
    return null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _resetPassword() {
    if (_formKey.currentState?.validate() ?? false) {
      AuthController authController = AuthController();
      authController.resetPassword(
        context,
        _emailController.text,
        _newPasswordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Faixa acima do título
          Container(
            height: 100,
            color: AppColors.primary,
            child: Center(
              child: const Text(
                'Esqueci minha senha',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(child: SizedBox(height: double.infinity)),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Digite seu e-mail e uma nova senha para redefinir sua senha',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    LoginTextFormField(
                      controller: _emailController,
                      hintText: 'E-mail',
                      icon: Icons.email,
                      validator: Validators.email,
                    ),
                    const SizedBox(height: 16),
                    LoginTextFormField(
                      controller: _newPasswordController,
                      hintText: 'Nova senha',
                      icon: Icons.lock,
                      obscureText: true,
                      validator: Validators.password,
                    ),
                    const SizedBox(height: 16),
                    LoginTextFormField(
                      controller: _confirmPasswordController,
                      hintText: 'Confirmar nova senha',
                      icon: Icons.lock,
                      obscureText: true,
                      validator: _validateConfirmPassword,
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      onPressed: () => _resetPassword(),
                      text: 'Redefinir Senha',
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: const Text('Voltar ao Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: SizedBox(height: double.infinity)),
        ],
      ),
    );
  }
}