import 'dart:convert';

import 'package:tela_de_cadastro/model/pessoa.dart';
import 'package:http/http.dart' as http;

class ApiConexao{
  String urlBase;
  ApiConexao({required this.urlBase});

  Future<List<Pessoa>> getPessoas() async {
    http.Response resposta = await http.get(Uri.parse(urlBase+'/photos'));
    var dados = json.decode(resposta.body);
    List<Pessoa> pessoas = <Pessoa>[];
    dados.forEach((pessoa){
      pessoas.add(Pessoa(
        id: pessoa['id'],
        nome: pessoa['title'],
        imagemPath: pessoa['url'],
        codigo: pessoa['albumId']
      ));
    });

    return pessoas;
  }
}