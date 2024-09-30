import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:teste_flutter/app_controller.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
    State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipOval(
                // borderRadius: BorderRadius.circular(50),
                child: Image.asset('assets/images/perfil.jpg')
              ),
              accountName: const Text('Robert Michael'),
              accountEmail: const Text('rob@gmail.com'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Início'),
              subtitle: const Text('Tela de início'),
              onTap: (){
                if (kDebugMode) {
                  print('home');
                }
              }
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              subtitle: const Text('Finalizar sessão'),
              onTap: (){
                Navigator.of(context).pushReplacementNamed('/');
              }
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Contador'),
        backgroundColor: Colors.red,
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255), // Cor do texto
          fontSize: 24,         // Tamanho do texto
          fontWeight: FontWeight.bold, // Negrito (opcional)
        ),
        actions: const [
          CustomSwich()
        ],
      ),

      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column( 
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text('Quantidade de vezes que você clicou no botão'),
            ),
            Container(height: 10),
            Align(
              alignment: Alignment.center,
              child: Text('Contador: $counter'),
            ),
          ]
        )
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: (){
          setState(() {
            counter++;
          });
        },
        child: const Icon(Icons.add)
      ),
    );
  }
}

class CustomSwich extends StatelessWidget {
  const CustomSwich({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: Colors.green,  // Cor quando ativo
      value: AppController.instance.isDarkTheme, 
      onChanged: (value) {
        AppController.instance.changeTheme();
    });
  }
}
