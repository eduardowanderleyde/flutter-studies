import 'package:flutter/material.dart';
import 'package:initial_code/pages/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key});

  @override
  Widget build(BuildContext context) {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  void saveData(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}
  void handleLoginButtonPressed() {
  String username = usernameController.text;
  String password = passwordController.text;

  // Salvar os dados no SharedPreferences
  saveData("username", username);
  saveData("password", password);
  // Aqui você pode adicionar lógica para autenticar o usuário ou navegar para outra tela após o login.
}
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Nome'),
              controller: usernameController,
            ),
            const SizedBox(height: 16), // Espaço entre os campos de texto
            const TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16), // Espaço entre os campos de texto
            TextField(
              obscureText: true,
              controller: passwordController, // Para esconder o texto digitado (senha)
              decoration: const InputDecoration(labelText: 'Senha'),
            ),
            const SizedBox(height: 16), // Espaço entre os campos de texto
            const TextField(
              obscureText: true, // Para esconder o texto digitado (confirmação de senha)
              decoration: InputDecoration(labelText: 'Confirmar Senha'),
            ),
            const SizedBox(height: 16), // Espaço entre os campos de texto
            ElevatedButton(
              onPressed: () {
                  handleLoginButtonPressed();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
              },
              child: const Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
