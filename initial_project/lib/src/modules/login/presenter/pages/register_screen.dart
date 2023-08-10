import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

    Future<void> saveData(String key, String value) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
    }

    void handleRegisterButtonPressed() async {
      String username = usernameController.text;
      String password = passwordController.text;
      String confirmPassword = confirmPasswordController.text;

      if (username.length < 6 || password.length < 6) {
        _showErrorDialog(context, 'Nome de usuário e senha devem ter pelo menos 6 caracteres.');
        return;
      }

      if (password != confirmPassword) {
        _showErrorDialog(context, 'As senhas não coincidem. Por favor, tente novamente.');
        return;
      }

      await saveData(username, password);

      // Pode adicionar lógica para autenticar o usuário ou navegar para outra tela após o registro.
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/img/lorem.jpg',
                width: 500,
                height: 500,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: 'Nome'),
              controller: usernameController,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Senha'),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              controller: confirmPasswordController,
              decoration: const InputDecoration(labelText: 'Confirmar Senha'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: handleRegisterButtonPressed,
              child: const Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro de Registro'),
          content: Text(errorMessage),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
