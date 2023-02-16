import 'package:flutter/material.dart';
import 'package:flutter_application/initialize-app.dart';

/*
O qe pode ser melhorado neste projeto? 
01 - Excesso de comentários dificulta a leitura do código
02 - Definir nomes sugestivos
03 - Várias classes em um único arquivo
04 - Muita tabulação dificulta a leitura
05 - Criação de objetos na apassagem de parâmetros
06 - Complicar para descomplicar (definir funções/componentes)
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const BuildApp();
  }
}
