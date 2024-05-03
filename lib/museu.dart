import 'package:flutter/material.dart';
import 'main.dart';
import 'exposicao.dart';

void museusTela(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Museus()), 
  );
}

void main() {
  runApp(const Museus());
}

class Museus extends StatelessWidget {
  const Museus({super.key});

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
              child: menuSuperior(), // import da main.dart pra nao colar a classe do menu aqui de novo
            ),
            Positioned.fill( // deixa as duas classes de menu sobreporem a lista
              top: 80, // pra lista nao ficar por baixo do container do menu
              child: Center(
                child: MuseusLista(),
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

class MuseusLista extends StatelessWidget {
  const MuseusLista({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6, // numero total de elementos criados, coloquei 6 de exemplo
      itemBuilder: (BuildContext context, int index) {
        return const MuseusNome();
      },
    );
  }
}

class MuseusNome extends StatelessWidget {
  const MuseusNome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Exp()),
              );
            },
            child: Container(
              height: 200,
              width: 200,
              alignment: Alignment.centerLeft,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: <Widget>[
                  Container(
                    width: double.infinity,
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
                      width: 200,
                      height: 30,
                      child: const Center(
                        child: Text(
                          'nome museu',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Exp()),
              );
            },
            child: Container(
              height: 200,
              width: 200,
              alignment: Alignment.centerRight,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/exp2.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      color: const Color(0xFF0072ce),
                      width: 200,
                      height: 30,
                      child: const Center(
                        child: Text(
                          'museu nome',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

