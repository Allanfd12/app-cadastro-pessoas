import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:tela_de_cadastro/controler/api_conexao.dart';

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
  final ApiConexao api =
      ApiConexao(urlBase: 'https://jsonplaceholder.typicode.com');
  final TextEditingController nome = TextEditingController();
  final TextEditingController codigo = TextEditingController();
  final TextEditingController dataNascimento = TextEditingController();
  final TextEditingController sexo = TextEditingController();
  final TextEditingController rua = TextEditingController();
  final TextEditingController numero = TextEditingController();
  final TextEditingController bairro = TextEditingController();
  final TextEditingController cidade = TextEditingController();
  DateTime selectedDate = DateTime.now();
  ImageProvider? imagem;
  String? imagemUrl;
  String titulo = '';
  String textoAcao = '';
  late IconData iconeAcao;
  late VoidCallback acao;
  Widget botaoExcluir = Container();
  bool processando = false;

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
      if (widget.pessoa.imagemUrl != null) {
        imagem = NetworkImage(widget.pessoa.imagemUrl!);
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

  void _cadastraPessoa() async {
    if(processando){
      return;
    }
    processando = true;
    if (_formKey.currentState != null) {
      if (!_formKey.currentState!.validate()) {
        processando = false;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Erro ao Cadastrar"), backgroundColor: Colors.red));
        return;
      }
      _formKey.currentState!.save();
      if (imagemUrl != null) {
        widget.pessoa.imagemUrl = imagemUrl;
      }

      if (await api.cadastroPessoa(widget.pessoa)) {
        _limpaFormulario();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Cadastrado"), backgroundColor: Colors.green));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Erro inersperado ao realizar o cadastro"), backgroundColor: Colors.red));
      }
      processando = false;
    }
  }

  void _limpaFormulario() {
    nome.value = valor('');
    codigo.value = valor('');
    sexo.value = valor('');
    dataNascimento.value = valor('');
    rua.value = valor('');
    numero.value = valor('');
    bairro.value = valor('');
    cidade.value = valor('');
    imagem = null;
    setState(() {});
  }

  void _editaPessoa() {}

  void _excluirPessoa() {}

  void _capturaImagem() async {
    final resposta = await Navigator.pushNamed(context, "/camera");
    if (resposta != null) {
      try {
        imagemUrl = resposta.toString();
        imagem = FileImage(File(imagemUrl!));
      } catch (e) {
        return;
      }
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
                        onSaved: (value) => widget.pessoa.nome = value,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MyInputText(
                              nomeCampo: "Código",
                              controller: codigo,
                              onSaved: (value) => widget.pessoa.codigo = value,
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
                                onSaved: (value) => widget.pessoa.sexo = value,
                                nomeCampo: "Sexo",
                                itens: const ['M', 'F']),
                          )
                        ],
                      ),
                      MyInputText(
                        nomeCampo: "Data de Nascimento",
                        onTap: () => _selectDate(context),
                        onSaved: (value) =>
                            widget.pessoa.dataNascimento = value,
                        readOnly: true,
                        controller: dataNascimento,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MyInputText(
                              nomeCampo: "Rua",
                              onSaved: (value) => widget.pessoa.rua = value,
                              controller: rua,
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            child: MyInputText(
                              nomeCampo: "Número",
                              controller: numero,
                              onSaved: (value) => widget.pessoa.numero = value,
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
                        onSaved: (value) => widget.pessoa.bairro = value,
                      ),
                      MyInputText(
                        nomeCampo: "Cidade",
                        controller: cidade,
                        onSaved: (value) => widget.pessoa.cidade = value,
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
