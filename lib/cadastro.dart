import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'my_input_text.dart';
import 'my_select.dart';

class CadastroPessoa extends StatefulWidget {
  const CadastroPessoa({Key? key}) : super(key: key);

  @override
  _CadastroPessoaState createState() => _CadastroPessoaState();
}

class _CadastroPessoaState extends State<CadastroPessoa> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String valor = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey,
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: SingleChildScrollView(
          child: Form(
            key:_formKey,
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyInputText(
                        nomeCampo: "teste",
                        maxLength: 20,
                        textInputType: TextInputType.number,
                        autofocus: true,
                        textInputFormatter: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      MySearchableSelect(
                          controller: TextEditingController(),
                          nomeCampo: "teste",
                          itens: [
                            'Abacaxi',
                            'Laranja',
                            'Castanhas',
                            'Peras',
                            'Uvas',
                            'Cenouras',
                            'Abacates',
                            'Melancias',
                            'Aboboras'
                          ]),
                      MySearchableSelect(
                          controller: TextEditingController(),
                          nomeCampo: "teste",
                          itens: [
                            'Abacaxi',
                            'Laranja',
                            'Castanhas',
                            'Peras',
                            'Uvas',
                            'Cenouras',
                            'Abacates',
                            'Melancias',
                            'Aboboras'
                          ]),
                      MySearchableSelect(
                          controller: TextEditingController(),
                          nomeCampo: "teste",
                          itens: [
                            'Abacaxi',
                            'Laranja',
                            'Castanhas',
                            'Peras',
                            'Uvas',
                            'Cenouras',
                            'Abacates',
                            'Melancias',
                            'Aboboras'
                          ]),
                      MySearchableSelect(
                          controller: TextEditingController(),
                          nomeCampo: "teste",
                          itens: [
                            'Abacaxi',
                            'Laranja',
                            'Castanhas',
                            'Peras',
                            'Uvas',
                            'Cenouras',
                            'Abacates',
                            'Melancias',
                            'Aboboras'
                          ]),
                      MySearchableSelect(
                          controller: TextEditingController(),
                          nomeCampo: "teste",
                          itens: [
                            'Abacaxi',
                            'Laranja',
                            'Castanhas',
                            'Peras',
                            'Uvas',
                            'Cenouras',
                            'Abacates',
                            'Melancias',
                            'Aboboras'
                          ]),
                      MyInputText(
                        nomeCampo: "teste",
                      ),
                      MySearchableSelect(
                          controller: TextEditingController(),
                          nomeCampo: "teste",
                          itens: [
                            'Abacaxi',
                            'Laranja',
                            'Castanhas',
                            'Peras',
                            'Uvas',
                            'Cenouras',
                            'Abacates',
                            'Melancias',
                            'Aboboras'
                          ]),
                      MyInputText(
                        nomeCampo: "Valor",
                        prefixo: 'R\$ ',
                        maxLength: 20,
                        textInputType: TextInputType.number,
                      ),
                      MySearchableSelect(
                          controller: TextEditingController(),
                          nomeCampo: "teste",
                          itens: [
                            'Abacaxi',
                            'Laranja',
                            'Castanhas',
                            'Peras',
                            'Uvas',
                            'Cenouras',
                            'Abacates',
                            'Melancias',
                            'Aboboras'
                          ]),
                      MySearchableSelect(
                          controller: TextEditingController(),
                          nomeCampo: "teste",
                          itens: [
                            'Abacaxi',
                            'Laranja',
                            'Castanhas',
                            'Peras',
                            'Uvas',
                            'Cenouras',
                            'Abacates',
                            'Melancias',
                            'Aboboras'
                          ]),
                      MyInputText(
                          nomeCampo: "Observações",
                          textInputType: TextInputType.multiline),
                    ],
                  )))),
    );
  }
}
