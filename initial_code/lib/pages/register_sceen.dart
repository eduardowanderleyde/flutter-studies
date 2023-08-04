import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(height: 16), // Espaço entre os campos de texto
            const TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16), // Espaço entre os campos de texto
            const TextField(
              obscureText: true, // Para esconder o texto digitado (senha)
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            const SizedBox(height: 16), // Espaço entre os campos de texto
            const TextField(
              obscureText: true, // Para esconder o texto digitado (confirmação de senha)
              decoration: InputDecoration(labelText: 'Confirmar Senha'),
            ),
            const SizedBox(height: 16), // Espaço entre os campos de texto
            ElevatedButton(
              onPressed: () {
                // Adicione aqui a lógica para processar o registro do usuário
              },
              child: const Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
