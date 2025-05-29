import 'package:atividade4/screens/auth/register_screen.dart';
import 'package:atividade4/screens/home/home_screen.dart';
import 'package:atividade4/screens/auth/login_screen.dart';
import 'package:atividade4/screens/user/user_screen.dart';
import 'package:atividade4/shared/themes/theme_provider.dart';
import 'package:atividade4/shared/utils/shared_preferences.dart';
import 'package:atividade4/screens/auth/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Modules/splash_screen.dart';
import 'Modules/onboarding_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Flutter App Atividade 05',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: themeProvider.lightTheme,
      darkTheme: themeProvider.darkTheme,
      initialRoute: '/',
      routes: {
        '/':
            (context) => FutureBuilder<bool>(
              future: SharedPreferencesUtils.isLoggedIn(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SplashScreen(
                    nextRoute: '/onboarding',
                    lottiePath: 'assets/animations/splash_animation.json',
                  );
                } else if (snapshot.hasData && snapshot.data == true) {
                  // Usuário já está logado, vai direto para Home
                  Future.microtask(
                    () => Navigator.of(context).pushReplacementNamed('/home'),
                  );
                  return SizedBox.shrink();
                } else {
                  // Usuário não está logado, mostra SplashScreen normal
                  return SplashScreen(
                    nextRoute: '/onboarding',
                    lottiePath: 'assets/animations/splash_animation.json',
                  );
                }
              },
            ),
        '/onboarding':
            (context) => const OnboardingScreen(loginRoute: '/login'),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/user': (context) => UserScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
      },
    );
  }
}
