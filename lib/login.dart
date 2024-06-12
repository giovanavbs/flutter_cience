import 'package:flutter/material.dart';
//import 'package:flutter_cience/museu.dart';
import 'main.dart';

void main() {
  runApp(const Login());
}

class DadosLogin {
  String nome = '';
  String usuario = '';
  String senha = '';
}

class SalvarLogin {
  static DadosLogin? dadosLogin;
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

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFORM createState() => LoginFORM();
}

class LoginFORM extends State<LoginForm> with SingleTickerProviderStateMixin {
  late TabController abas;
  late PageController pag;
  DadosLogin dadosLogin = DadosLogin();

  @override
  void initState() {
    super.initState();
    abas = TabController(length: 2, vsync: this);
    pag = PageController();

    abas.addListener(() {
      pag.animateToPage(
        abas.index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
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
                  buildLoginForm(context),
                  buildCadastroForm(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLoginForm(BuildContext context) {
    final formID = GlobalKey<FormState>();
    final TextEditingController usuarioController = TextEditingController();
    final TextEditingController senhaController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: formID,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Usuário',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: usuarioController,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira seu usuário';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Senha',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: senhaController,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira sua senha';
                }
                return null;
              },
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
                if (formID.currentState!.validate()) {
                  dadosLogin.usuario = usuarioController.text;
                  dadosLogin.senha = senhaController.text;
                  SalvarLogin.dadosLogin = dadosLogin;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Perfil(dadosLogin: dadosLogin),
                    ),
                  );
                }
              },
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCadastroForm(BuildContext context) {
    final formID = GlobalKey<FormState>();
    final TextEditingController nomeController = TextEditingController();
    final TextEditingController usuarioController = TextEditingController();
    final TextEditingController senhaController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: formID,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Nome',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: nomeController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                hintText: 'Digite seu nome',
                filled: true,
                fillColor: Colors.grey[200],
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide.none,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira seu nome';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Usuário',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: usuarioController,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira um usuário';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Senha',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: senhaController,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira sua senha';
                }
                return null;
              },
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
                if (formID.currentState!.validate()) {
                  dadosLogin.nome = nomeController.text;
                  dadosLogin.usuario = usuarioController.text;
                  dadosLogin.senha = senhaController.text;
                  showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Sucesso!'),
                              content: const Text('Usuário cadastrado com sucesso, realize o login!'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                        }
                      },
                      child: const Text(
                        'Cadastrar',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }


class Perfil extends StatelessWidget {
  final DadosLogin dadosLogin;

  const Perfil({super.key, required this.dadosLogin});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('seja bem-vindo, ${dadosLogin.nome}!'),
                  duration: const Duration(seconds: 5),
                ),
              );
            });

            return Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: menuSuperior(),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/perfil.png'),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Nome: ${dadosLogin.nome}',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Usuário: ${dadosLogin.usuario}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: menuInferior(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
