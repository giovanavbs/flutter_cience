import 'package:flutter/material.dart';
import 'package:flutter_cience/exposicao2.dart';
import 'package:flutter_cience/exposicao3.dart';
import 'package:flutter_cience/exposicao4.dart';
import 'main.dart';
import 'exposicao.dart';
import 'login.dart';

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
      itemCount: 1, // trocado pra 1 pq os elementos vao ser criados direto no MuseusNome, antes era um exemplo usando repetição
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
      child: Stack(
        children: [
          Row(
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
                  height: 190,
                  width: 190,
                  alignment: Alignment.centerLeft,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/masp.jpg"),
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
                              'Masp',
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
                    MaterialPageRoute(builder: (context) => Exposi()),
                  );
                },
                child: Container(
                  height: 190,
                  width: 190,
                  alignment: Alignment.centerRight,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/museucatavento.jpg"),
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
                              'Museu Catavento',
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
          Padding(
            padding: const EdgeInsets.only(top: 220.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Exposicao()),
                    );
                  },
                  child: Container(
                    height: 190,
                    width: 190,
                    alignment: Alignment.centerLeft,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/museufavelas.jpg"),
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
                                'Museu das Favelas',
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
                      MaterialPageRoute(builder: (context) => Exposicao4()),
                    );
                  },
                  child: Container(
                    height: 190,
                    width: 190,
                    alignment: Alignment.centerRight,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/MAB.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            color: const Color(0xFF0072ce),
                            width: 200,
                            height: 40,
                            child: const Center(
                              child: Text(
                                'MAB: Museu da Arqueologia Bíblica',
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
          ),
        ],
      ),
    );
  }
}