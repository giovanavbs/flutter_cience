import 'main.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const Favorito());
}

class Favorito extends StatelessWidget {
  const Favorito({super.key});

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
              child: FavoritoLista(),
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

/* exemplo de classe stateful
class YellowBird extends StatefulWidget {
  const YellowBird({ super.key });

  @override
  State<YellowBird> createState() => _YellowBirdState();

  class _YellowBirdState extends State<YellowBird> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
} */ 

class FavoritoLista extends StatefulWidget { // StatelessWidget foi retirado dessa classe pq só aceita valores constantes(e dava erro por conta das variaveis)
  const FavoritoLista({super.key});

  @override
  State<FavoritoLista> createState() => _FavoritoListaState();
} // pq classe stateful é estruturada assim?

class _FavoritoListaState extends State<FavoritoLista> {
  bool favoritar = true;

  @override
  Widget build(BuildContext context) {
    Widget imgAtual;

    if (favoritar) {
      imgAtual = Image.asset('assets/images/favoritos.png');
    } 
    else {
      imgAtual = Image.asset('assets/images/favoritado.png');
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          favoritar = false;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        //color: Colors.white,
        child: imgAtual,
      ),
    );
  }
}



