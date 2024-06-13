import 'package:flutter/material.dart';
import 'package:flutter_cience/expo.dart';
import 'package:flutter_cience/museu.dart';
import 'main.dart';
import 'exposicao.dart';

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

class MuseusLista extends StatefulWidget {
  const MuseusLista({super.key});

  @override
  MuseusLISTA createState() => MuseusLISTA();
}
class MuseusLISTA extends State<MuseusLista> {

    @override
  void initState() {
    super.initState();
  }

List<Museu> museus = <Museu>[
    Museu('Masp', "assets/images/masp.jpg", <Expo>[
        const Expo("FRANCIS BACON: A BELEZA DA CARNE", 'O pintor irlandês Francis Bacon (1909-1992) foi um dos artistas mais extraordinários do século 20, e esta é a primeira exposição individual no Brasil dedicada a sua obra. Ao criar um conjunto de pinturas tão radical quanto arrebatador, o artista revolucionou o modo de pintar a figura humana.', 'FRANCIS BACON', 'FRANCIS.png'),
        const Expo('ACERVO EM TRANSFORMAÇÃO', 'Acervo em transformação é o título da exposição de longa duração da coleção do MASP. As obras são instaladas nos cavaletes de cristal — placas de vidro encaixadas em blocos de concreto — que ficam dispostos em fileiras sem divisórias na sala ampla do segundo andar do museu.', 'Sem artista definido', 'acervo1.jpg')
        ]),
      Museu('Museu Catavento', "assets/images/museucatavento.jpg",   <Expo>[
        const Expo("A ORIGEM DA VIDA", 'Como surgiu e qual é o seu lugar entre os seres vivos?', 'Sem autor definido', 'origem.jpg'),
        const Expo('VIDA NO OCEANO', ' ANIMAIS NO OCEANO: O que você vê parece plantas, mas são animais.', 'Sem autor definido', 'OCEANO.jpeg')
  ]),
      Museu( 'Museu das Favelas', "assets/images/museufavelas.jpg", <Expo>[
        const Expo("FAVELA-RAIZ", 'FAVELA-RAIZ é uma ocupação-manifesto, composta de cinco partes – três internas e duas externas – que nos levam aos fundamentos da formação da identidade das pessoas que habitam esses territórios: a ancestralidade, as mulheres, a força do trabalho e os abrigos materiais e afetivos.', 'A obra é composta por diversos autores e colaboradores', 'favelaraiz.jpg'),
        const Expo('RAP EM QUADRINHOS', ' O Museu das Favelas e Ação Educativa apresentam a exposição “Rap em Quadrinhos”. A exposição surgiu através colaboração entre o ilustrador Wagner Loud e o Youtuber Løad, com o propósito de prestar homenagem à algumas personalidades do rap nacional, retratando-as como renomados super-heróis e super-heroínas das histórias em quadrinhos. Ao todo, são 19 homenageados, habilmente representados como ícones dentro do vasto universo dos quadrinhos.', 'Wagner Loud', 'RAP.jpg')
  ]),
   Museu(  'MAB: Museu da Arqueologia Bíblica', "assets/images/MAB.jpeg", <Expo>[
    const Expo("HISTÓRIA DA BÍBLIA", 'Nesta seção, é possível conhecer o processo de escrita, compilação e tradução da Bíblia. Em cada letra da palavra BÍBLIA, são expostos materiais que foram utilizados para a escrita da Bíblia. No centro do espaço, está em exposição uma das Bíblias impressas mais antigas da história: trata-se de uma Vulgata Latina de 1528.', 'Sem autor definido', 'historia.jpg'),
    const Expo('JARDIM DA BÍBLIA', 'Um dos pontos mais surpreendentes da visitação ao MAB é o Jardim da Bíblia. No pátio externo foi construído um jardim com 17 espécies de árvores mencionadas na Bíblia – cedro, oliveira, tamareira, videira, romeira etc. - distribuídas de forma paisagística e ornamental. Entre as árvores, plantas bíblicas como o joio, o trigo, o papiro, entre outras, foram espalhadas.', 'Sem artista definido', 'jardim.jpg')
  ])
  ];

  @override
  Widget build(BuildContext context) {
        return Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView.builder(
        itemCount: museus.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext, index) {
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
                    MaterialPageRoute(builder: (context) => Exp(),
                    settings: RouteSettings(
                    arguments:museus[index].expos,
                    ),
                  ),
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
                        decoration:  BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(museus[index].img),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          color: const Color(0xFF0072ce),
                          width: 200,
                          height: 30,
                          child: Center(
                            child: Text(museus[index].nome),
                              //style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ],
            ),
          ],
        ),
      );
    }
  ),
  );
}
}