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
      theme: ThemeData(
        primaryColor: Color.fromRGBO(254, 24, 60, 1),

      ),
      routes:{
        "/cadastro": (context)=> CadastroPessoa(),
        "/pessoas": (context)=> Pessoas(),
      }

  )
  );
}
