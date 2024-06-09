import 'main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

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
              top: 0, // sem bottom ele fica no topo
              child: menuSuperior(),
            ),
            Positioned.fill( 
              top: 80, // o form de login nao fica por baixo do menuSuperior
              child: Center(
                child: LoginForm(),
              ),
            ),
            Positioned(
              left: 0, 
              right: 0,
              bottom: 0, // pra ficar na parte de baixo sem top
              child: menuInferior(),
            ),
          ],
        ),
      ),
    ),
  );
 }
}


// classe com o layout de login, efeito de trocar de aba pra login/cadastro só por estetica e teste de efeitos no flutter

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with SingleTickerProviderStateMixin {
  late TabController abas; // a aba de login/cadastro
  late PageController pag; // a pagina que é exibida na troca de aba de login para cadastro viceversa

  @override
  void initState() {
    super.initState();
    abas = TabController(length: 2, vsync: this); // vsync sincroniza verticalmente a animação com a taxa de atualização do dispositivo, nesse caso o this determina que esse elemento sera usado como parametro de atualização
    pag = PageController();

    abas.addListener(() {
      pag.animateToPage(
        abas.index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      ); // efeito da animação da troca de aba
    });
  }

  @override
  void dispose() {
    abas.dispose();
    pag.dispose();
    super.dispose();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: TabBar( 
                controller: abas,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                tabs: const [
                  Tab(text: 'LOGIN'),
                  Tab(text: 'CADASTRO'),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: pag,
                onPageChanged: (index) {
                  abas.animateTo(index);
                },
                children: [
                  FormLogin(),
                  FormCadastro(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget FormLogin() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Usuário',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: 'Digite o usuário',
              filled: true,
              fillColor: Colors.grey[200],
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Senha',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              hintText: 'Digite a senha',
              filled: true,
              fillColor: Colors.grey[200],
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.blue,
            ),
            onPressed: () {
              // ação de login 
            },
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget FormCadastro() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Nome',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: 'Digite seu nome',
              filled: true,
              fillColor: Colors.grey[200],
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Usuário',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: 'Digite o usuário',
              filled: true,
              fillColor: Colors.grey[200],
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Senha',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              hintText: 'Digite a senha',
              filled: true,
              fillColor: Colors.grey[200],
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.blue,
            ),
            onPressed: () {
              // ação de cadastro
            },
            child: const Text(
              'Cadastrar',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

/* antigo login sem a animação
class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              'Usuário',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              hintText: 'Digite o usuário',
              filled: true,
              fillColor: Colors.grey[200],
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: const Text(
              'Senha',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              hintText: 'Digite a senha',
              filled: true,
              fillColor: Colors.grey[200],
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: const Color(0xFF0072ce),
              ),
              onPressed: () {
                // ação de login
              },
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/