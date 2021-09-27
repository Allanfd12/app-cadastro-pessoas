import 'package:flutter/material.dart';
import 'package:tela_de_cadastro/controler/api_conexao.dart';

import '../model/pessoa.dart';
import 'cadastro.dart';

class Pessoas extends StatefulWidget {
  final ApiConexao api =
      ApiConexao(urlBase: 'https://jsonplaceholder.typicode.com');

  Pessoas({Key? key}) : super(key: key);

  @override
  _PessoasState createState() => _PessoasState();
}

class _PessoasState extends State<Pessoas> {
  void _verPessoa(pessoa) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CadastroPessoa(
          pessoa: pessoa,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(254, 24, 60, 1),
          title: const Text("Listagem de Pessoas"),
        ),
        body: FutureBuilder<List<Pessoa>>(
            future: widget.api.getPessoas(),
            builder: (context, dados) {
              switch (dados.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.active:
                case ConnectionState.done:
                  if (dados.hasError || dados.data == null) {
                    return const Center(
                      child: Text('Erro ao carregar os dados, tente novamente'),
                    );
                  }
                  return Scrollbar(
                      child: ListView.builder(
                    itemCount: dados.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      ImageProvider imagem;
                      if (dados.data![index].imagemUrl != null) {
                        imagem = NetworkImage(dados.data![index].imagemUrl!);
                      } else {
                        imagem = const AssetImage('imagens/perfil.png');
                      }

                      return ListTile(
                        title: Text('${dados.data![index].nome}'),
                        subtitle: Text('Código ${dados.data![index].codigo}'),
                        onTap: () => _verPessoa(dados.data![index]),
                        leading: Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill, image: imagem))),
                      );
                    },
                  ));
              }
            }));
  }
}
