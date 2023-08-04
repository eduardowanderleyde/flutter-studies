import 'package:flutter/material.dart';
import 'package:initial_code/pages/register_sceen.dart';
import 'package:initial_code/pages/task_list.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/img/1.png', width: 500, height: 500),
              const SizedBox(height: 10),
              const LoginCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

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


    return Card(
      color: const Color(0xFF00FF00), // Utilizando um valor hexadecimal (0xFF00FF00 - verde)
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
             Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: usernameController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder()
                ),
              ),
            ),
            const SizedBox(height: 20),
             Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border:OutlineInputBorder()
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {


                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TaskList()),
                );
              },
              child: const Text('Enviar'),
            ),
            const SizedBox(height: 10), // Espaço entre os botões (ElevatedButton
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  handleLoginButtonPressed();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFFFFF), // Exemplo de outra cor (0xFF123456 - roxo)
                ),
                child: const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
