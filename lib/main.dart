import 'package:flutter/material.dart';
import 'package:tela_de_cadastro/view/cadastro.dart';
import 'package:tela_de_cadastro/view/pessoas.dart';
import 'package:tela_de_cadastro/controler/camera_control.dart';
import 'package:tela_de_cadastro/view/home.dart';
import 'package:camera/camera.dart';

List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WK Tecnology",
      home:const Home(),
      initialRoute: "/",
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(254, 24, 60, 1),

      ),
      routes:{
        "/cadastro": (context)=>  CadastroPessoa(),
        "/pessoas": (context)=> Pessoas(),
        "/camera": (context)=> TakePictureScreen(
          // Pass the appropriate camera to the TakePictureScreen widget.
          camera: firstCamera,
        )
      }

  )
  );
}
