import 'package:flutter/material.dart';
import 'cientista.dart';

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
              top: 0, // vai ficar na parte superior entao sem bottom
              child: menuSuperior(),
            ),
            Positioned.fill( // deixa as duas classes de menu sobreporem a lista
              top: 80, // pra lista nao ficar por baixo do container do menu
              child: Center(
                child: MuseusExp(),
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

class MuseusExp extends StatelessWidget {
  const MuseusExp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6, // numero total de elementos criados, coloquei 6 de exemplo
      itemBuilder: (BuildContext context, int index) {
        return const exposicao();
      },
    );
  }
}

class exposicao extends StatelessWidget {
  const exposicao({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 200, // altura para a imagem 1(foto da exposição)
            child: Stack( // o stack é um elemento que permite que um widget sobreponha outro(nesse caso o container 2 esta sobrepondo a foto da exposição)
              alignment: Alignment.bottomLeft, // determina que o widget(container) vai sobrepor a parte inferior esquerda do elemento(foto da exposiçãp)
              children: <Widget>[
                Container(
                  width: 400,
                //color: Colors.blue, cor usada antes de adicionar a imagem como teste
                  decoration: const BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/images/exp1.jpg"), // foto da exposição, só aparece a primeira img pq ainda n foi criado com variavel e laço de repetição
                  fit: BoxFit.cover, // a imagem fica por todo o espaço do container sem distorcer
                ),
               ),
              ),
                Positioned(
                  child: Container(
                    color: const Color(0xFF00FFD1),
                    width: 150,
                    height: 40,
                    child: const Center(child: Text('nome da exposição')),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100, // altura da segunda imagem
            child: Column( // column pro layout ficar organizado de forma vertical
              children: <Widget>[
                Flexible( // container flexible para que  tamanho possa se adequar ao texto da descrição
                  child: Container(
                    width: 400,
                    color: const Color(0xFF04856D),
                    child: const Center(child: Text(' descrição da exposição')), // center utilizado para que o texto esteja centralizado, o const esta sendo usado aqui pq é um exemplo, no futuro quando for usado uma variavel o valor vai deixar de ser constante
                  ),
                ),
                Flexible(
                  child: Container(
                    width: 400,
                    height: 40,
                    color: const Color(0xFF00FFD1),
                    child: TextButton(
                      onPressed: () {
                        // ação quando o botão for pressionado, o print é só para teste, no futuro vai redirecionar para a tela de cientistas
                         cientistaTela(context); // Chama a função de navegação
                      }, 
                        child: const Align( // const apenas para ele parar de dar erro
                        alignment: Alignment.centerLeft,
                        child: Text('nome do principal cientista'),   
                    ),
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
          bottom: 0, // sem padding 
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
          bottom: 0, // todos zerados menos left pra ficar alinahdo a esquerda
          child: Image.asset(
            'assets/images/login.png',
            width: 50, 
            height: 50, 
            alignment: Alignment.centerLeft,
          ),
        ),
      ],
    ),
  );
}
}

// classe para o menu superior que sobrepõe tudo na tela

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
