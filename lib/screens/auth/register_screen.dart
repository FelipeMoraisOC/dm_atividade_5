import 'package:atividade4/screens/auth/auth_controller.dart';
import 'package:atividade4/screens/auth/widgets/login_text_form_field.dart';
import 'package:atividade4/shared/utils/textformfield_validators.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirme a senha';
    } else if (value != _passwordController.text) {
      return 'As senhas não coincidem';
    }
    return null;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState?.validate() ?? false) {
      AuthController authController = AuthController();
      authController.registerUser(
        context,
        _emailController.text,
        _phoneController.text,
        _nameController.text,
        _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    TextFormFieldValidators validators = TextFormFieldValidators();

    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Usuário')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              LoginTextFormField(
                controller: _nameController,
                labelText: 'Nome Completo',
                hintText: 'Informe seu nome completo',
                icon: Icons.person,
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Informe o nome'
                            : null,
              ),
              const SizedBox(height: 16),
              LoginTextFormField(
                controller: _emailController,
                labelText: 'E-mail',
                hintText: 'Informe seu e-mail',
                icon: Icons.email,

                keyboardType: TextInputType.emailAddress,
                validator: validators.validateEmail,
              ),
              const SizedBox(height: 16),
              LoginTextFormField(
                controller: _phoneController,
                labelText: 'Telefone',
                hintText: '(12) 94567-8912',
                icon: Icons.phone,
                inputFormatters: [validators.phoneFormatter],
                keyboardType: TextInputType.phone,
                validator: validators.validatePhone,
              ),
              const SizedBox(height: 16),
              LoginTextFormField(
                controller: _passwordController,
                labelText: 'Senha',
                hintText: 'Informe sua senha',
                icon: Icons.lock,
                obscureText: true,
                validator: validators.validatePassword,
              ),
              const SizedBox(height: 16),
              LoginTextFormField(
                controller: _confirmPasswordController,
                labelText: 'Confirmar Senha',
                hintText: 'Confirme sua senha',
                icon: Icons.lock,
                obscureText: true,
                validator: _validateConfirmPassword,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _register,
                child: const Text('Registrar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text('Já tem uma conta? Faça login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
