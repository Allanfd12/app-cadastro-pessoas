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
  final bool? readOnly;
  final TextEditingController? controller;
  final FormFieldSetter<String>? onSaved;
  final GestureTapCallback? onTap;
  const MyInputText({Key? key, required this.nomeCampo, this.textInputType, this.readOnly, this.textInputFormatter, this.maxLength, this.prefixo, this.maxLines, this.autofocus, this.controller, this.onSaved, this.onTap}) : super(key: key);

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
                cursorColor: const Color.fromRGBO(254, 24, 60, 1),
                readOnly: widget.readOnly == true,
                onSaved: widget.onSaved,
                onTap: widget.onTap,
                controller: widget.controller,
                maxLines: widget.maxLines,
                autofocus: widget.autofocus == true,
                keyboardType:widget.textInputType,
                maxLength: widget.maxLength,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                inputFormatters:widget.textInputFormatter, // Impede a escrita de letras
                decoration: InputDecoration(
                  counterText:'',
                  labelText: widget.nomeCampo,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold,color:Color.fromRGBO(254, 24, 60, 1)),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),borderSide: const BorderSide(color:Color.fromRGBO(254, 24, 60, 1), width: 1.5)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  prefixText: widget.prefixo,
                ),
              ),
            ]
        )
    );
  }
}
