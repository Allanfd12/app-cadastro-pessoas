import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _cadastrar() {
    Navigator.pushNamed(context, "/cadastro");
  }

  void _pesquisar(){
    Navigator.pushNamed(context, "/pessoas");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(230, 237, 241, 1),
        body: Container(
            padding: const EdgeInsets.all(40),
            color: const Color.fromRGBO(230, 237, 241, 1),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Image.asset(
                      'imagens/Logo.png',
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Divider(thickness: 2, height: 10),
                  const Spacer(),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(children: [
                          Expanded(
                              child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                  child: ElevatedButton.icon(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        32.0),
                                                side: const BorderSide(
                                                    color: Colors.red))),
                                        backgroundColor:
                                            MaterialStateProperty
                                                .all<Color>(const Color.fromRGBO(
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
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(children: [
                          Expanded(
                              child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                  child: ElevatedButton.icon(
                                    onPressed: _pesquisar,
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        32.0),
                                                side: const BorderSide(
                                                    color: Colors.red))),
                                        backgroundColor:
                                            MaterialStateProperty
                                                .all<Color>(const Color.fromRGBO(
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
                        const SizedBox(
                          height: 40.0,
                        ),
                      ]),
                ])));
  }
}
