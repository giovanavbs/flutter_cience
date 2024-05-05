import 'main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background_cinza.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: const Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0, // sem bottom ele fica no topo
              child: menuSuperior(),
            ),
            Positioned.fill( 
              top: 80, // o form de login nao fica por baixo do menuSuperior
              child: Center(
                child: loginForm(),
              ),
            ),
            Positioned(
              left: 0, 
              right: 0,
              bottom: 0, // pra ficar na parte de baixo sem top
              child: menuInferior(),
            ),
          ],
        ),
      ),
    ),
  );
 }
}


// classe com o layout de login

class loginForm extends StatelessWidget {
  const loginForm ({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10), // espaço entre o texto usuario e o text form field pra n ficar colado
            child: const Text(
              'usuario',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration( // sugere usar o inputdecoration pra colocar o hint
              hintText: 'digite o usuario',
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20), // margin entre o dois text form field pra n ficar colado
            child: const Text(
              'senha',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'digite a senha',
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20), // espaço pro botão login n colar 
            child: ElevatedButton(
              onPressed: () {
                // sem função de login por enquanto
              },
              child: Text('login'),
            ),
          ),
        ],
      ),
    );
  }
}
