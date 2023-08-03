import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            SizedBox(height: 16), // Espaço entre os campos de texto
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16), // Espaço entre os campos de texto
            TextField(
              obscureText: true, // Para esconder o texto digitado (senha)
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            SizedBox(height: 16), // Espaço entre os campos de texto
            TextField(
              obscureText: true, // Para esconder o texto digitado (confirmação de senha)
              decoration: InputDecoration(labelText: 'Confirmar Senha'),
            ),
          ],
        ),
      ),
    );
  }
}
