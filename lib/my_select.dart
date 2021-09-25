import 'package:flutter/material.dart';

class MySearchableSelect extends StatefulWidget {
  final String nomeCampo;
  final List<String> itens;
  final TextEditingController controller;
  final FormFieldSetter<String>? onSaved;
  MySearchableSelect(
      {Key? key, required this.nomeCampo, required this.itens, TextEditingController? controller, this.onSaved})
      : this.controller = (controller ?? TextEditingController()),super(key: key) ;

  @override
  _MySearchableSelectState createState() => _MySearchableSelectState();
}

class _MySearchableSelectState extends State<MySearchableSelect> {
  List<String> itens = [];
  int? indiceSelecionado;
  String textoSelecionado = '';


  @override
  void initState() {
    super.initState();
    itens = widget.itens;
  }

  void _search(texto) {
    if (texto == '') {
      itens = widget.itens;
      return;
    }
    itens = [];
    widget.itens.forEach((element) {
      if (element.toLowerCase().contains(texto.toLowerCase())) {
        itens.add(element);
      }
    });
  }

  void _selecionar(index) {
    //atualiza o index
    indiceSelecionado = index;
    textoSelecionado = itens[index];

    // atualiza o texto no Campo de texto
    widget.controller.value = TextEditingValue(
      text: textoSelecionado,
      selection: TextSelection.fromPosition(
        TextPosition(offset: textoSelecionado.length),
      ),
    );

    //fecha o dialog
    Navigator.of(context, rootNavigator: true).pop();
  }
  void _abrirDialog(){
    _search('');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
              insetPadding: EdgeInsets.fromLTRB(20, 80, 20, 20),
              titlePadding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              title: TextFormField(
                cursorColor: const Color.fromRGBO(254, 24, 60, 1),
                  decoration: InputDecoration(
                    labelText: widget.nomeCampo,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color:Color.fromRGBO(254, 24, 60, 1)),
                    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color:Color.fromRGBO(254, 24, 60, 1))),
                    floatingLabelBehavior: FloatingLabelBehavior.always,

                  ),
                  onChanged: (texto) => setState(() {
                    _search(texto);
                  }),
                  autofocus: true),
              content: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Scrollbar(
                    isAlwaysShown: true,
                    child: ListView.builder(
                      itemCount: itens.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: () => setState(() {
                            _selecionar(index);
                          }),
                          title: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text('${itens[index]}'),
                                Divider()
                              ]),
                        );
                      },
                    ),
                  )));
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //  color: Color.fromRGBO(230, 230, 230, 1),
        margin: EdgeInsets.only(bottom: 5, top: 5),
        padding: EdgeInsets.all(5),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextFormField(
            cursorColor: Color.fromRGBO(254, 24, 60, 1),
            onSaved: widget.onSaved,
            autofocus:false,
            controller: widget.controller,
            decoration: InputDecoration(
              suffixIcon: const Icon(
                Icons.arrow_drop_down_outlined, color:Color.fromRGBO(254, 24, 60, 1)
              ),
              labelText: widget.nomeCampo,
              labelStyle: TextStyle(fontWeight: FontWeight.bold,color:Color.fromRGBO(254, 24, 60, 1)),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),borderSide: const BorderSide(color:Color.fromRGBO(254, 24, 60, 1), width: 1.5)),
            ),
            readOnly: true,
            onTap: () =>_abrirDialog(),
          ),
        ]));
  }
}
