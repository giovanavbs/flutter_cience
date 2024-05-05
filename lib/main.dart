import 'package:flutter/material.dart';
import 'package:flutter_cience/favorito.dart';
import 'museu.dart'; 
import 'cientista.dart'; 
import 'login.dart'; 

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
                top: 0,
                child: menuSuperior(),
              ),
              Positioned.fill(
                top: 80,
                child: Center(
                  child: Inicio(),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: menuInferior(), 
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// classe para o menu superior que sobrepõe tudo na tela - criei fora pq dentro era uma bagunça com chaves e stack tudo torto



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
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Image.asset(
                'assets/images/login.png',
                width: 50,
                height: 50,
                alignment: Alignment.centerLeft,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// classe real da tela

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 200, 
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sp.jpeg'), 
              fit: BoxFit.cover, 
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20), // espaço entre a imagem e texto
          padding: const EdgeInsets.all(20.0), // espaço entre as bordas pro texto nao colar
          // color: Colors.blue, 
          child: const Text(
            'bla bla bla', 
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0, 
            ),
          ),
        ),
      ],
    );
  }
}

/* menuInferior anterior que nao era clicavel
class menuInferior extends StatelessWidget {
  const menuInferior({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned( // o return é usado para devolver os widgets(nesse caso as imagens e texts que estao dentro do positioned)
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: 80, 
        color: const Color(0xFF363636),
        child: Row( // organiza os elementos horizontalmente, usado pra deixar as imagens um do lado da outra
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // spacebetween faz com que os elementos sejam organizados entre si do começo ao fim da linha horizontal
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 60.0, right: 0.0, top: 0.0),
              child: Container(
                width: 80,
                height: 80,
                child: Column( // organiza os elementos verticalmente, tipo o layout linear
                  mainAxisAlignment: MainAxisAlignment.center, // coloca os elementos alinhados verticalmente(x) na column
                  children: [
                    Image.asset(
                      'assets/images/museus.png',
                      width: 50,
                      height: 50,
                    ),
                    const Text(
                      'museus',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: 80,
                height: 80,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/cientistas.png',
                        width: 50,
                        height: 50,
                      ),
                      const Text(
                        'cientistas',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 60.0, left: 0.0),
              child: Container(
                width: 80,
                height: 80,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/favoritos.png',
                        width: 50,
                        height: 50,
                      ),
                      const Text(
                        'favoritos',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

// para tornar as imagens clicaveis existe o atributo GestureDetector com o onTap que determina que ao clicar vai pra outra pagina
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // mainAxisAlignment define como os widgets vao ser distribuidos no row / spaceBetween define que vai ser igualmente
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Museus()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 60.0, right: 0.0, top: 0.0),
                child: Container(
                  width: 80,
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/museus.png',
                        width: 50,
                        height: 50,
                      ),
                      const Text(
                        'museus',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cientista()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: 80,
                  height: 80,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/cientistas.png',
                          width: 50,
                          height: 50,
                        ),
                        const Text(
                          'cientistas',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Favorito()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 60.0, left: 0.0),
                child: Container(
                  width: 80,
                  height: 80,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/favoritos.png',
                          width: 50,
                          height: 50,
                        ),
                        const Text(
                          'favoritos',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
