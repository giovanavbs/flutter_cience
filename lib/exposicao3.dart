import 'package:flutter/material.dart';
import 'package:flutter_cience/expo.dart';
import 'favorito.dart';
import 'main.dart';

void main() {
  runApp(const Exposicao());
}

class Exposicao extends StatelessWidget {
  const Exposicao({super.key});

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
                child: ExposicaoApp(),
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

class ExposicaoApp extends StatefulWidget {
  const ExposicaoApp({super.key});

  @override
  ExposicaoAPP createState() => ExposicaoAPP();
}

class ExposicaoAPP extends State<ExposicaoApp> {
  // Lista para armazenar os itens favoritos
  List<Expo> expos = [
    const Expo("FAVELA-RAIZ", 'FAVELA-RAIZ é uma ocupação-manifesto, composta de cinco partes – três internas e duas externas – que nos levam aos fundamentos da formação da identidade das pessoas que habitam esses territórios: a ancestralidade, as mulheres, a força do trabalho e os abrigos materiais e afetivos.', 'A obra é composta por diversos autores e colaboradores', 'favelaraiz.jpg'),
    const Expo('RAP EM QUADRINHOS', ' O Museu das Favelas e Ação Educativa apresentam a exposição “Rap em Quadrinhos”. A exposição surgiu através colaboração entre o ilustrador Wagner Loud e o Youtuber Løad, com o propósito de prestar homenagem à algumas personalidades do rap nacional, retratando-as como renomados super-heróis e super-heroínas das histórias em quadrinhos. Ao todo, são 19 homenageados, habilmente representados como ícones dentro do vasto universo dos quadrinhos.', 'Wagner Loud', 'RAP.jpg')
  ];

  List<Expo> favoritos = [];

  @override
  void initState() {
    super.initState();
  }

  // alterar a imagem do fav e lista de favoritos
  void AlterarFavorito(Expo expo) {
    setState(() {
      if (favoritos.contains(expo)) {
        favoritos.remove(expo);
      } else {
        favoritos.add(expo);
      }
    });
    NavFavoritos(context, favoritos);
  }

  // mandar pra tela fav com as variaveis pra criar a lista de la
  void NavFavoritos(BuildContext context, List<Expo> favoritos) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FavoritoTela(favoritos: favoritos),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
        itemCount: expos.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final expo = expos[index];
          final exposicaoFavorita = favoritos.contains(expo); // verifica se a lista possui o elemento e retorna true, bool
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    Column(
                      children: [
                        SizedBox(
                          height: 200, // altura para a imagem 1(foto da exposição)
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
                          height: 200,
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
                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        icon: Icon(
                          exposicaoFavorita ? Icons.favorite : Icons.favorite_border, 
                          color: exposicaoFavorita ? Colors.red : Colors.white, // se a exposição for favorita - icon vermelho, se nao icon branco
                        ),
                        onPressed: () {
                          AlterarFavorito(expo); // chama o metodo e entrega o parametro com as variavies
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
