import 'package:flutter/material.dart';
import 'package:flutter_application/ui/cnpj_page.dart';
import 'package:flutter_application/ui/cpf_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Página inicial')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CpfPage(),
                ),
              ),
              child: const Text('Validar CPF'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CnpjPage(),
                ),
              ),
              child: const Text('Validar CNPJ'),
            ),
          ],
        ),
      ),
    );
  }
}
