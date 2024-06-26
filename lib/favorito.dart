import 'package:flutter/material.dart';
import 'package:flutter_cience/expo.dart';
//import 'exposicao.dart';
import 'main.dart';
import 'museus.dart';

void main() {
  runApp(const FavoritoTela(favoritos: [],));
}

class FavoritoTela extends StatelessWidget {
  final List<Expo> favoritos;

  const FavoritoTela({super.key, required this.favoritos});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFF363636),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Center(
              child: Image.asset(
                'assets/images/fantastic.png',
                width: 50,
                height: 50,
              ),
            ),
          ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background_cinza.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 10,
              bottom: 80,
              child: ListView.builder(
                itemCount: favoritos.length,
                itemBuilder: (context, index) {
                  final expo = favoritos[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          height: 200,
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: <Widget>[
                              Container(
                                width: 400,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/${expo.img}"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                child: Container(
                                  color: const Color(0xFF00FFD1),
                                  width: 150,
                                  height: 40,
                                  child: Center(child: Text(expo.nomeExpo)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          child: Column(
                            children: <Widget>[
                              Flexible(
                                child: Container(
                                  width: 400,
                                  color: const Color(0xFF04856D),
                                  child: Center(child: Text(expo.descricaoExpo)),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  width: 400,
                                  height: 40,
                                  color: const Color(0xFF00FFD1),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(expo.nomeCientista),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: menuInferior(),
            ),
          ],
        ),
      ),
    );
  }
}

// classe temporaria enquanto o contexto correto do favorito nao é repassado para a tela inicial(a lista de favs só é gerada se partir da exposicao.dart)
class SemFavoritos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF363636),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Center(
            child: Image.asset(
              'assets/images/fantastic.png',
              width: 50,
              height: 50,
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background_cinza.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(50.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF363636), 
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Nenhuma exposição foi adicionada aos favoritos! Verifique nossos museus e adicione as exposições que mais gostar aos favoritos para que possam ser visualizadas aqui!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Museus()),
                            );
                          },
                          child: const Text('Ver Museus'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: menuInferior(),
            ),
          ],
        ),
      ),
    );
  }
}