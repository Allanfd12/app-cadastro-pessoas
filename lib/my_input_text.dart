import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyInputText extends StatefulWidget {
  final String nomeCampo;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatter;
  final int? maxLength;
  final String? prefixo;
  final int? maxLines;
  final bool? autofocus;
  final TextEditingController? controller;
  final FormFieldSetter<String>? onSaved;
  const MyInputText({Key? key, required this.nomeCampo, this.textInputType, this.textInputFormatter, this.maxLength, this.prefixo, this.maxLines, this.autofocus, this.controller, this.onSaved}) : super(key: key);

  @override
  _MyInputTextState createState() => _MyInputTextState();
}

class _MyInputTextState extends State<MyInputText> {

  @override
  Widget build(BuildContext context) {

    return Container(
      // color: Color.fromRGBO(230, 230, 230, 1),
        margin: EdgeInsets.only(bottom: 5, top: 5),
        padding: EdgeInsets.all(5),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                onSaved: widget.onSaved,
                controller: widget.controller,
                maxLines: widget.maxLines,
                autofocus: widget.autofocus == true,
                keyboardType:widget.textInputType,
                inputFormatters:widget.textInputFormatter, // Impede a escrita de letras
                decoration: InputDecoration(
                  labelText: widget.nomeCampo,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  prefixText: widget.prefixo,
                ),
              ),
            ]
        )
    );
  }
}
