import 'package:flutter/material.dart';

import 'cadastro.dart';
import 'model/pessoa.dart';

class Pessoas extends StatefulWidget {
  const Pessoas({Key? key}) : super(key: key);

  @override
  _PessoasState createState() => _PessoasState();
}

class _PessoasState extends State<Pessoas> {

  void _verPessoa(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CadastroPessoa(pessoa:Pessoa(nome: "Allan França Dutra"), edicao: true,),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(254, 24, 60, 1),
          title: Text("Listagem de Pessoas"),
        ),
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Primary text'),
              subtitle: Text('Secondary text'),
              onTap: _verPessoa,
              leading:Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1024px-Circle-icons-profile.svg.png')
                      )
                  )),
            );
          },
        ));
  }
}
