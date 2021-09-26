import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../component/my_input_text.dart';
import '../component/my_select.dart';
import '../model/pessoa.dart';

class CadastroPessoa extends StatefulWidget {
  Pessoa pessoa;
  bool tipo;

  CadastroPessoa({Key? key, Pessoa? pessoa})
      : pessoa = (pessoa ?? Pessoa()),
        tipo = (pessoa != null),
        super(key: key);

  @override
  _CadastroPessoaState createState() => _CadastroPessoaState();
}

class _CadastroPessoaState extends State<CadastroPessoa> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController nome = TextEditingController();
  final TextEditingController codigo = TextEditingController();
  final TextEditingController dataNascimento = TextEditingController();
  final TextEditingController sexo = TextEditingController();
  final TextEditingController rua = TextEditingController();
  final TextEditingController numero = TextEditingController();
  final TextEditingController bairro = TextEditingController();
  final TextEditingController cidade = TextEditingController();
  DateTime selectedDate = DateTime.now();
  FileImage? imagem;
  String titulo = '';
  String textoAcao = '';
  late IconData iconeAcao;
  late VoidCallback acao;
  Widget botaoExcluir = Container();

  TextEditingValue valor(String val) {
    return TextEditingValue(
      text: val,
      selection: TextSelection.fromPosition(
        TextPosition(offset: val.length),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.tipo) {
      titulo = "Edição de pessoa";
      textoAcao = "Editar";
      iconeAcao = Icons.edit_rounded;
      if (widget.pessoa.nome != null) {
        nome.value = valor(widget.pessoa.nome!);
      }
      if (widget.pessoa.codigo != null) {
        codigo.value = valor(widget.pessoa.codigo!.toString());
      }
      if (widget.pessoa.sexo != null) {
        sexo.value = valor(widget.pessoa.sexo!);
      }
      if (widget.pessoa.dataNascimento != null) {
        dataNascimento.value = valor(widget.pessoa.dataNascimento!);
      }
      if (widget.pessoa.rua != null) {
        rua.value = valor(widget.pessoa.rua!);
      }
      if (widget.pessoa.numero != null) {
        numero.value = valor(widget.pessoa.numero!.toString());
      }
      if (widget.pessoa.bairro != null) {
        bairro.value = valor(widget.pessoa.bairro!);
      }
      if (widget.pessoa.cidade != null) {
        cidade.value = valor(widget.pessoa.cidade!);
      }
      acao = _editaPessoa;

      botaoExcluir = Row(children: [
        Expanded(
            child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton.icon(
                  onPressed: _excluirPessoa,
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                              side: const BorderSide(color: Colors.red))),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(254, 24, 60, 1))),
                  label: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Excluir Pessoa',
                        style: TextStyle(fontSize: 20),
                      )),
                  icon: const Icon(Icons.delete_rounded),
                )))
      ]);
    } else {
      titulo = "Cadastro de pessoa";
      textoAcao = "Cadastrar";
      iconeAcao = Icons.add_rounded;
      acao = _cadastraPessoa;
    }
  }

  void _cadastraPessoa() {}

  void _editaPessoa() {}

  void _excluirPessoa() {}

  void _capturaImagem() async {
    final resposta = await Navigator.pushNamed(context, "/camera");
    if (resposta != null) {
      imagem = FileImage(File(resposta.toString()));
      setState(() {});
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dataNascimento.value =
            valor(DateFormat('dd/MM/yyyy').format(selectedDate));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(254, 24, 60, 1),
        title: Text(titulo),
      ),
      body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: _capturaImagem,
                        child: Container(
                            height: MediaQuery.of(context).size.width * 0.6,
                            width: MediaQuery.of(context).size.width * 0.6,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromRGBO(254, 24, 60, 1)),
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.black26,
                              foregroundImage: imagem,
                              child: const Icon(
                                Icons.add_a_photo,
                                size: 50,
                                color: Colors.white,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      MyInputText(
                        nomeCampo: "Nome",
                        controller: nome,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MyInputText(
                              nomeCampo: "Código",
                              controller: codigo,
                              maxLength: 20,
                              textInputType: TextInputType.number,
                              textInputFormatter: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            child: MySearchableSelect(
                                controller: sexo,
                                nomeCampo: "Sexo",
                                itens: const ['M', 'F']),
                          )
                        ],
                      ),
                      MyInputText(
                        nomeCampo: "Data de Nascimento",
                        onTap: () => _selectDate(context),
                        readOnly: true,
                        controller: dataNascimento,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MyInputText(
                              nomeCampo: "Rua",
                              controller: rua,
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            child: MyInputText(
                              nomeCampo: "Número",
                              controller: numero,
                              maxLength: 7,
                              textInputType: TextInputType.number,
                              textInputFormatter: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          )
                        ],
                      ),
                      MyInputText(
                        nomeCampo: "Bairro",
                        controller: bairro,
                      ),
                      MyInputText(
                        nomeCampo: "Cidade",
                        controller: cidade,
                      ),
                      Row(children: [
                        Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: ElevatedButton.icon(
                                  onPressed: acao,
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32.0),
                                              side: const BorderSide(
                                                  color: Colors.red))),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color.fromRGBO(
                                                  254, 24, 60, 1))),
                                  label: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        textoAcao,
                                        style: const TextStyle(fontSize: 20),
                                      )),
                                  icon: Icon(iconeAcao),
                                )))
                      ]),
                      botaoExcluir
                    ],
                  )))),
    );
  }
}
