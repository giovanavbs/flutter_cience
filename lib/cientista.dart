import 'package:flutter/material.dart';

void cientistaTela(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Cientista()), 
  );
}

void main() {
  runApp(const Cientista());
}

class Cientista extends StatelessWidget {
  const Cientista({super.key});

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
              top: 0, // vai ficar na parte superior entao sem bottom
              child: menuSuperior(),
            ),
            Positioned.fill( // deixa as duas classes de menu sobreporem a lista
              top: 80, // pra lista nao ficar por baixo do container do menu
              child: Center(
                child: CientistaBio(),
              ),
            ),
            Positioned(
              left: 0, 
              right: 0,
              bottom: 0, // parte inferior entao sem top
              child: menuInferior(),
            ),
          ],
        ),
      ),
    ),
  );
}

}


class CientistaBio extends StatelessWidget {
  const CientistaBio({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return const Biografia();
      },
    );
  }
}

class Biografia extends StatelessWidget {
  const Biografia({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: <Widget>[
          Container(
            height: 200, 
            child: Stack( 
              alignment: Alignment.bottomLeft, 
              children: <Widget>[
                Container(
                  width: 150,
                  decoration: const BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/images/exp1.jpg"), 
                  fit: BoxFit.cover, 
                ),
               ),
              ),
                Positioned(
                  child: Container(
                    color: const Color(0xFF0072ce),
                    width: 180,
                    height: 30,
                    child: const Center(child: Text(
                      'nome da exposição'
                      ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Container(
            width: 300, 
            height: 100,
            color: const Color(0xFF0f456f),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'biografia do cientista',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// classe para o menu inferior que sobrepõe tudo na tela, diferente da tela exposição

class menuInferior extends StatelessWidget {
  const menuInferior({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: 80,
        color: const Color(0xFF363636),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ Expanded(  
              child: Center(
                child: Image.asset(
                  'assets/images/museus.png',
                  width: 50, 
                  height: 50, 
                ),
              ),
            ),
            const Text(
              'Museus',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// classe para o menu superior que sobrepõe tudo na tela

class menuSuperior extends StatelessWidget {
  const menuSuperior({super.key});

  @override
Widget build(BuildContext context) {
  return Container(
    height: 80,
    width: double.infinity, // pegar o width inteiro da tela
    padding: const EdgeInsets.all(20.0),
    color: const Color(0xFF363636),
    child: Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Center(
            child: Image.asset(
              'assets/images/fantastic.png',
              width: 50, 
              height: 50, 
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Image.asset(
            'assets/images/login.png',
            width: 50, 
            height: 50, 
            alignment: Alignment.centerLeft,
          ),
        ),
      ],
    ),
  );
}
}
