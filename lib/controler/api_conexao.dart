
import 'package:tela_de_cadastro/model/pessoa.dart';
import 'package:dio/dio.dart';

class ApiConexao{
  String urlBase;
    ApiConexao({required this.urlBase});

  Future<List<Pessoa>> getPessoas() async {
    List<Pessoa> pessoas = <Pessoa>[];

      var resposta = await Dio().get(urlBase+'/photos');
      resposta.data.forEach((pessoa){
        pessoas.add(Pessoa(
            id: pessoa['id'],
            nome: pessoa['title'],
            imagemUrl: pessoa['url'],
            codigo: pessoa['albumId'].toString()
        ));
      });

    return pessoas;
  }
  Future<bool> cadastroPessoa(Pessoa pessoa) async{

    FormData formData = FormData.fromMap({
      "name": pessoa.nome,
      "codigo": pessoa.codigo,
      "sexo": pessoa.sexo,
      "dataNascimento": pessoa.dataNascimento,
      "rua": pessoa.rua,
      "numero": pessoa.numero,
      "bairro": pessoa.bairro,
      "cidade": pessoa.cidade,
      "imagem":  pessoa.imagemUrl == null? null : await MultipartFile.fromFileSync(pessoa.imagemUrl!, filename:"file.jpg")
    });
    try {
      var response = await Dio().post("https://teste1.tasktech.com.br/testeapp/", data: formData);
      return true;
    }catch (e) {
      return false;
    }
  }
  Future<bool> editaPessoa(Pessoa pessoa) async{

    FormData formData = FormData.fromMap({
      "id": pessoa.id,
      "name": pessoa.nome,
      "codigo": pessoa.codigo,
      "sexo": pessoa.sexo,
      "dataNascimento": pessoa.dataNascimento,
      "rua": pessoa.rua,
      "numero": pessoa.numero,
      "bairro": pessoa.bairro,
      "cidade": pessoa.cidade,
      "imagem":  pessoa.imagemUrl == null? null : await MultipartFile.fromFileSync(pessoa.imagemUrl!, filename:"file.jpg")
    });
    try {
      var response = await Dio().put("https://teste1.tasktech.com.br/testeapp/", data: formData);
      return true;
    }catch (e) {
      return false;
    }
  }
  Future<bool> excluiPessoa(Pessoa pessoa) async{

    FormData formData = FormData.fromMap({
      "id": pessoa.id,
    });
    try {
      var response = await Dio().delete("https://teste1.tasktech.com.br/testeapp/", data: formData);
      return true;
    }catch (e) {
      return false;
    }
  }
}