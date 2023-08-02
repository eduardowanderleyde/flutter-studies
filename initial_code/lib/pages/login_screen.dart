import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text ('Eduardo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children:[  
              Image.asset(('assets/img/login_image.jpg'),width: 200, height: 200),
              const SizedBox(height: 20,),
              const Text ('Nome de Usuário!', style: TextStyle(fontSize: 20)),
            ],
      ),
    )
    );


  }
}
