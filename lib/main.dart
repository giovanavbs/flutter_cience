import 'package:flutter/material.dart';

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
  decoration: const BoxDecoration( // const pq ele da erro se nao tiver
    image: DecorationImage(
      image: AssetImage("assets/images/background1.png"), // a proporção da imagem de fundo ainda tem que ser arrumada!!
      fit: BoxFit.cover,
    ),
  ),
        child: const Center(  // const novamente pq ele da erro
          child: MyListView(),
        ),
        ),
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6, // numero total de elementos criador(como é um exemplo estatico coloquei 6, mas futuramente será uma variavel)
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
                    color: Colors.green,
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
                    color: Colors.red,
                    child: const Center(child: Text(' descrição da exposição')), // center utilizado para que o texto esteja centralizado, o const esta sendo usado aqui pq é um exemplo, no futuro quando for usado uma variavel o valor vai deixar de ser constante
                  ),
                ),
                Flexible(
                  child: Container(
                    width: 400,
                    height: 40,
                    color: Colors.yellow,
                    child: TextButton(
                      onPressed: () {
                        // ação quando o botão for pressionado, o print é só para teste, no futuro vai redirecionar para a tela de cientistas
                        print('botão foi pressionado');
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
} // rascunho do codigo, ainda falta adicionar o botão de login no canto superior direito, dar a ação correta para o botão do cientista, criar a variavel, etc