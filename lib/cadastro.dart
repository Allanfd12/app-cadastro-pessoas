import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
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
  final TextEditingController dataNacimento = TextEditingController();
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        String tmp = DateFormat('dd/MM/yyyy').format(selectedDate);
        dataNacimento.value = TextEditingValue(
            text: tmp,
            selection: TextSelection.fromPosition(
            TextPosition(offset: tmp.length),
        ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(254, 24, 60, 1),
        title: Text("Cadastro de Pessoas"),
      ),
      body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyInputText(
                        nomeCampo: "Nome",
                      ),
                      Row(
                        children: [
                          Expanded(child:MyInputText(
                            nomeCampo: "Código",
                            maxLength: 20,
                            textInputType: TextInputType.number,
                            textInputFormatter: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),flex: 2,),
                          Expanded(child: MySearchableSelect(
                              controller: TextEditingController(),
                              nomeCampo: "Sexo",
                              itens: [
                                'M',
                                'F'
                              ]),)
                        ],
                      ),
                      MyInputText(
                        nomeCampo: "Data de Nascimento",
                        onTap:()=> _selectDate(context),
                        readOnly: true,
                        controller: dataNacimento,
                      ),
                      Row(
                        children: [
                          Expanded(child:MyInputText(
                            nomeCampo: "Rua",
                          ),flex: 2,),
                          Expanded(child: MyInputText(
                            nomeCampo:"Número",
                            maxLength: 20,
                            textInputType: TextInputType.number,
                            textInputFormatter: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),)
                        ],
                      ),
                      MyInputText(
                        nomeCampo: "Bairro",
                      ),
                      MyInputText(
                        nomeCampo: "Cidade",
                      ),
                    ],
                  )))),
    );
  }
}
