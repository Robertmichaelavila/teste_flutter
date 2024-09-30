import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  Widget _body(){
    return SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    'assets/images/logo.png'
                  ),
                ),
                const SizedBox(height: 30),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
                    child: Column(
                      children: [
                        const Text(
                          'Seja bem vindo!',
                          style: TextStyle(
                            fontSize: 26,
                            // color: Color.fromARGB(255, 78, 82, 86),
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          onChanged: (text) {
                            email = text;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                    
                          ),
                        ),
                        const SizedBox(height: 25),
                        TextField(
                            onChanged: (text) {
                            password = text;
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                    
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,  // Cor do texto
                            backgroundColor: const Color.fromARGB(255, 78, 82, 86),
                            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10), // Padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0), // Menos arredondado
                            ),
                            elevation: 10
                          ),
                          onPressed: () {
                            if(email == 'rob@gmail.com' && password == '12345'){
                              if (kDebugMode) {
                                print('Login Concluído');
                                
                              }
                              Navigator.of(context).pushReplacementNamed('/home');
                            }else if(email != 'rob@gmail.com' && password != '12345'){
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Error!'),
                                      content: const Text('Essa conta não existe!'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(); // Fecha o diálogo
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                              else if(email != 'rob@gmail.com' || password != '12345'){
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Error!'),
                                      content: const Text('Email ou senha inseridos estão incorretos!'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(); // Fecha o diálogo
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                          child: const Text(
                            'Entrar',
                            style: TextStyle(fontSize: 20), // Tamanho do texto
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ), 
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(color: Colors.black.withOpacity(0.3)),
          _body()
        ],
      )
    );
  }
}