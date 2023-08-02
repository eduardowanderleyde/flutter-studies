import 'package:flutter/material.dart';
import 'package:initial_code/pages/task_list.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text ('App'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children:[  
                Image.asset(('assets/img/login_image.jpg'),width: 300, height: 300),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                  ),
                ),
                const SizedBox(height: 60,),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),  
                  ),
                ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const TaskList()),
                  );
                },
                  child: const Text('Enviar'),
        
          ),
          const SizedBox(height: 20,),
          ]
              ),
        ),
    )
    
    );



  }
}
