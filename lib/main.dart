import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/setToken.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/slide_tile.dart';

void main() => runApp(MeuAplicativo());

class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => Home(),
        '/login': (context) => Login(),
        '/signup': (context) => Cadastrar(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  String username = "";
  mountUser() async {
    String user = await getUser();
    setState(() {
      username = user;
    });
    return username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF752c98)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              child: Image(
                image: AssetImage("assets/logo_fundoTransparente.png"),
              ),
            ),
            Container(
              child: Text(
                "YPPY",
                style: TextStyle(
                  color: Color(0xFF752c98),
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(),
      drawer: Drawer(
        child: MyDrawer(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home_sharp,
                  color: Color(0xFF752c98),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.search_sharp,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.library_add_sharp,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notifications_sharp),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.person_sharp,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Ocorreu um erro");
          }

          if (snapshot.hasData) {
            return ListView(
              children: [
                // ignore: missing_required_param
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFF752c98),
                  ),
                  accountName: Text(snapshot.data[0].replaceFirst(
                      snapshot.data[0][0], snapshot.data[0][0].toUpperCase())),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      snapshot.data[0][0].toUpperCase(),
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  subtitle: Text("Ir para Home"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    print('Voltar para o Inicio.');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.account_circle_outlined),
                  title: Text("Perfil"),
                  subtitle: Text("Siga para ver o seu perfil."),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    print('Ir para postagens.');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Logout"),
                  subtitle: Text("Faça Logout"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    logout();
                    Navigator.pushNamed(context, '/');
                  },
                ),
              ],
            );
          } else {
            return ListView(
              children: [
                // ignore: missing_required_param
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFF752c98),
                  ),
                  accountName: Text("YPPYVERSE"),
                  currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white, child: Text("Y")),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  subtitle: Text("Ir para Home"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    print('Voltar para o Inicio.');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.login),
                  title: Text("Login"),
                  subtitle: Text("Faça Login"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.login),
                  title: Text("Cadastrar"),
                  subtitle: Text("Crie uma conta"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                ),
              ],
            );
          }
        });
  }

  mountMenu(BuildContext context) {}
}
