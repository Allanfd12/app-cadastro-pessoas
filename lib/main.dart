import 'package:flutter/material.dart';
import 'package:tela_de_cadastro/cadastro.dart';
import 'package:tela_de_cadastro/pessoas.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Patrimônio Resolve",
      home:Home(),
      initialRoute: "/",
      routes:{
        "/cadastro": (context)=> CadastroPessoa(),
        "/pessoas": (context)=> Pessoas(),
      }
  )
  );
}
