import 'package:flutter/material.dart';
import 'package:flutter_cience/favorito.dart';
import 'package:flutter_cience/museu.dart';
import 'museus.dart'; 
import 'login.dart'; 
import 'expo.dart';
import 'package:flutter_cience/exposicao.dart';


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
                if (SalvarLogin.dadosLogin == null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Perfil(
                              dadosLogin: SalvarLogin.dadosLogin!,
                            )),
                  );
                }
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
      children: [ Stack( // stack pro texto sobrepor a imagem
          children: [
            Container(
              height: 200,
              width: double.infinity, // pra imagem ocupar a largura inteira da img
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/sp.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Positioned(
              left: 10,
              bottom: 10,
              child: Column( // pra adicionar os dois textos um abaixo do outro
                crossAxisAlignment: CrossAxisAlignment.start, // alinhado a esquerda
                children: [
                  Text(
                    'Explore \n São Paulo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    'Descubra a relevância de \n São Paulo para a arte.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ], 
              ), 
            ), 
          ], 
        ), 
        Container(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 10, left: 10), // 10 pixels de distância da direita
            width: 120,
            height: 40,
            color: const Color(0xFF00FFD1),
            child: const Center(
              child: Text(
                'CONHEÇA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10), // espaço entre os containers
          width: 450,
          height: 80,
          child: const Center(
            child: Text(
              'As exposições por trás dos museus expalhados por São Paulo.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: 450,
          height: 80,
          child: const Center(
            child: Text(
              'Diversos artistas excelentes, se expressando atráves da arte.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: 450,
          height: 80,
          child: const Center(
            child: Text(
              'As suas informações favoritas armazenadas em um só lugar.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ], 
    );
  }
}


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
                  MaterialPageRoute(builder: (context) => MainApp()),
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
                          'inicio',
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
                  MaterialPageRoute(builder: (context) => const Museus()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0),
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
                  List<Expo> favoritos = SalvarFavoritos();
          
                  if (favoritos.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FavoritoTela(favoritos: favoritos)),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SemFavoritos()), 
                    );
                  }
                },
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 0.0),
                child: SizedBox(
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
