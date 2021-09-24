import 'package:flutter/material.dart';

class Pessoas extends StatefulWidget {
  const Pessoas({Key? key}) : super(key: key);

  @override
  _PessoasState createState() => _PessoasState();
}

class _PessoasState extends State<Pessoas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(254, 24, 60, 1),
          title: Text("Listagem de Pessoas"),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('Primary text'),
                subtitle: Text('Secondary text'),
                leading:Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('imagens/pp.jfif')
                        )
                    )),// Image(image: AssetImage('imagens/pp.jfif')),
                trailing: Text('Metadata'),);
            },
          ),
        ));
  }
}
