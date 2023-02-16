import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  final Key? key;
  const FirstPage({this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Page')),
      body: Center(child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                label: Text('CPF'),
                hintText: 'Informe o CPF'
              ),
            ),
            const SizedBox(height: 15.0),
            ElevatedButton(onPressed: () {
              showAlertDialog(context: context, tittle: 'Informe o CPF', comment: 'CPF Correto');
            }, 
            child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}

Future showAlertDialog({required BuildContext context, required String tittle, required  String comment}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(tittle),
          content: Text(comment),
        );
      }
    );
}