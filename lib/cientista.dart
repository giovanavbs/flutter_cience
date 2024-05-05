import 'package:flutter/material.dart';
import 'main.dart';
import 'favorito.dart';

void cientistaTela(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Cientista()), 
  );
} // metodo criado para o botão da exposição trazer para esta tela

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

/*class Biografia extends StatelessWidget {
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
} */

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
            height: 250,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: <Widget>[
                Container(
                  width: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/exp1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned( // nesse positioned ele quer o const? mas nos outros fica de boa?
                  top: 0,
                  right: 0,
                  child: FavoritoLista(), // adicionando a imagem e funcionalidade do facorito
                ),
                Positioned(
                  child: Container(
                    color: const Color(0xFF0072ce),
                    width: 200,
                    height: 30,
                    child: const Center(
                      child: Text('nome da exposição'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 350,
            height: 150,
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

