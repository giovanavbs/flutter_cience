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

    final List<Expo> expos = ModalRoute.of(context)!.settings.arguments as List<Expo>;

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background_cinza.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              const Positioned(
                left: 0,
                right: 0,
                top: 0, // vai ficar na parte superior entao sem bottom
                child: menuSuperior(),
              ),

              Positioned.fill( // deixa as duas classes de menu sobreporem a lista
                top: 80, // pra lista nao ficar por baixo do container do menu
                child: Center(
                  child: ExposiApp(expos: expos),
                ),
              ),
              const Positioned(
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
  final List<Expo> expos;

  const ExposiApp({required this.expos, super.key});

  @override
  ExposiAPP createState() => ExposiAPP();
}

class ExposiAPP extends State<ExposiApp> {
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
        itemCount: widget.expos.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final exposicaoFavorita = favoritos.contains(widget.expos[index]); // verifica se a lista possui o elemento e retorna true, bool
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
                                    image: AssetImage('assets/images/${widget.expos[index].img}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                child: Container(
                                  color: const Color(0xFF00FFD1),
                                  width: 150,
                                  height: 40,
                                  child: Center(child: Text(widget.expos[index].nomeExpo)),
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
                                  child: Center(child: Text(widget.expos[index].descricaoExpo)),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  width: 400,
                                  height: 40,
                                  color: const Color(0xFF00FFD1),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(widget.expos[index].nomeCientista),
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
                          AlterarFavorito(widget.expos[index]); // chama o método e entrega o parâmetro com as variaveis
                        },
                      ),
                    )
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
