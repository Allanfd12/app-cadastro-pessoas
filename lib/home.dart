import 'package:flutter/material.dart';

import 'cadastro.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _cadastrar() {
    Navigator.pushNamed(context, "/cadastro");
  }

  void _pesquisar() {
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
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(children: [
                              Expanded(
                                  child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: ElevatedButton.icon(
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            32.0),
                                                    side: BorderSide(
                                                        color: Colors.red))),
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .all<Color>(Color.fromRGBO(
                                                        254, 24, 60, 1))),
                                        onPressed: _cadastrar,
                                        label: const Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "Cadastrar Pessoa",
                                              style: TextStyle(fontSize: 20),
                                            )),
                                        icon: const Icon(Icons.add_rounded),
                                      )))
                            ]),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(children: [
                              Expanded(
                                  child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: ElevatedButton.icon(
                                        onPressed: _pesquisar,
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            32.0),
                                                    side: BorderSide(
                                                        color: Colors.red))),
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .all<Color>(Color.fromRGBO(
                                                        254, 24, 60, 1))),
                                        label: const Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "Pessoas",
                                              style: TextStyle(fontSize: 20),
                                            )),
                                        icon: const Icon(Icons.person_rounded),
                                      )))
                            ]),
                            SizedBox(
                              height: 40.0,
                            ),
                          ]),
                    ]))));
  }
}
