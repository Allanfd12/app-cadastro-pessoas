import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _cadastrarNovoBem() {
    Navigator.pushNamed(context, "/cadastro");
  }

  void _pesquisaBem() {
    Navigator.pushNamed(context, "/pessoas");
  }

  @override
  Widget build(BuildContext context) {
    Color corFundo = Color.fromRGBO(230, 237, 241, 1);
    return Scaffold(
        backgroundColor: Color.fromRGBO(230, 237, 241, 1),
        body: Container(
            child: Container(
                padding: EdgeInsets.all(40),
                color: Color.fromRGBO(230, 237, 241, 1),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: Image.asset(
                          'imagens/Logo.png',
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),

                      Divider(thickness: 2, height: 10),
                      Spacer(),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                                onTap: _cadastrarNovoBem,
                                child: Container(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Column(children: [
                                      Icon(Icons.add),
                                      Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text("Cadastro",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      37, 150, 190, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  letterSpacing: 1)))
                                    ]))),
                            GestureDetector(
                                onTap: _pesquisaBem,
                                child: Container(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Column(children: [
                                      Material(
                                          color: corFundo,
                                          child: InkWell(
                                              onTap: _pesquisaBem,
                                              borderRadius:
                                              BorderRadius.circular(100),
                                              child: Container(
                                                  padding: EdgeInsets.all(10),
                                                  child: Icon(Icons.add),))),
                                      Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text("Pessoas",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      37, 150, 190, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  letterSpacing: 1)))
                                    ])))
                          ]),
                    ]))));
  }
}
