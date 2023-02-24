import 'package:flutter/material.dart';
import 'package:flutter_application/core/components/alert_dialog.dart';
import 'package:flutter_application/core/components/cpf_validator.dart';
import 'package:flutter_application/core/components/text_form_fiel.dart';

class FirstPage extends StatelessWidget {
  final Key? key;

  FirstPage({this.key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String cpf = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Page')),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              CustomTextFormField(
                inputText: 'Informe o CPF',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'CPF obrigatório!';
                  }

                  if (CpfValidator.validateCpf(value)) {
                    cpf = value;
                  } else {
                    return 'CPF inválido!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15.0),
              ElevatedButton(
                onPressed: () => {
                  if (_formKey.currentState!.validate())
                    {
                      CustomAlertDialog.showAlertDialog(
                        context: context,
                        tittle: 'O CPF informado foi:',
                        comment: cpf,
                      ),
                    }
                },
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
