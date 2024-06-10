import 'package:flutter/material.dart';
import 'favorito.dart';
import 'main.dart';
import 'expo.dart';

void main() {
  runApp(const Exp());
}

class Exp extends StatelessWidget {
  const Exp({super.key});

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
                  child: ExposiApp(),
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

class ExposiApp extends StatefulWidget {
  const ExposiApp({super.key});

  @override
  ExposiAPP createState() => ExposiAPP();
}

class ExposiAPP extends State<ExposiApp> {
  // Lista para armazenar os itens favoritos
  List<Expo> expos = [
    const Expo("FRANCIS BACON: A BELEZA DA CARNE", 'O pintor irlandês Francis Bacon (1909-1992) foi um dos artistas mais extraordinários do século 20, e esta é a primeira exposição individual no Brasil dedicada a sua obra. Ao criar um conjunto de pinturas tão radical quanto arrebatador, o artista revolucionou o modo de pintar a figura humana.', 'FRANCIS BACON', 'FRANCIS.png'),
    const Expo('ACERVO EM TRANSFORMAÇÃO', 'Acervo em transformação é o título da exposição de longa duração da coleção do MASP. As obras são instaladas nos cavaletes de cristal — placas de vidro encaixadas em blocos de concreto — que ficam dispostos em fileiras sem divisórias na sala ampla do segundo andar do museu.', 'Sem artista definido', 'acervo1.jpg')
  ];

  static List<Expo> favoritos = [];

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
                          AlterarFavorito(expo); // chama o método e entrega o parâmetro com as variáveis
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
List<Expo> SalvarFavoritos() {
  return ExposiAPP.favoritos;
}
