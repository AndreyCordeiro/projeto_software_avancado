import 'package:flutter_application/core/components/cnpj_validator.dart';

class ValidateCpf {
  bool cpfIsEmpty(String cpf) {
    if (cpf.isEmpty) {
      throw Exception('CPF não pode ser vazio!');
    }
    return true;
  }

  bool isCorrectSize(String cpf) {
    if (cpf.length != 14) {
      throw Exception('CPF deve possuir 14 caracteres');
    }
    return true;
  }

  bool isCorrectFormat(String cpf) {
    var regExp = RegExp(r'\d{3}\.\d{3}\.\d{3}\-\d{2}');

    if (!regExp.hasMatch(cpf)) {
      throw Exception('CPF de possuir o formato: 111.111.111-11');
    }
    return true;
  }

  List<int> unformatCpf(String cpf) {
    cpfIsEmpty(cpf);

    return cpf
        .replaceAll('.', '')
        .replaceAll('-', '')
        .substring(0, 9)
        .split('')
        .map<int>((element) => int.parse(element))
        .toList();
  }

  int isFirtsDigitValid(String cpf) {
    cpfIsEmpty(cpf);

    var cpfSemMascara = cpf.replaceAll('.', '').replaceAll('-', '');

    var cpfListaNumeros = cpfSemMascara
        .substring(0, 9)
        .split('')
        .map<int>((e) => int.parse(e))
        .toList();

    var primeiroDigito = int.parse(cpfSemMascara.substring(9, 10));

    var peso = 10;
    var digitoCalculado = 0;

    for (var n in cpfListaNumeros) {
      digitoCalculado += peso * n;
      peso--;
    }

    digitoCalculado = 11 - (digitoCalculado % 11);

    if (digitoCalculado > 9) digitoCalculado = 0;
    if (primeiroDigito != digitoCalculado) throw Exception('CPF inválido!');

    return primeiroDigito;
  }

  int isSecondDigitValid(String cpf) {
    cpfIsEmpty(cpf);

    var cpfSemMascara = cpf.replaceAll('.', '').replaceAll('-', '');

    var cpfListaNumeros = cpfSemMascara
        .substring(0, 9)
        .split('')
        .map<int>((e) => int.parse(e))
        .toList();

    var segundoDigito = int.parse(cpfSemMascara.substring(10, 11));

    var peso = 11;
    var digitoCalculado = 0;

    for (var n in cpfListaNumeros) {
      digitoCalculado += peso * n;
      peso--;
    }

    digitoCalculado = 11 - (digitoCalculado % 11);

    if (digitoCalculado > 10) digitoCalculado = 0;

    return segundoDigito;
  }

  bool isLastTwoDigitsValid(String cpf) {
    cpfIsEmpty(cpf);

    var cpfSemMascara = cpf.replaceAll('.', '').replaceAll('-', '');

    var primeiroDigito = int.parse(cpfSemMascara.substring(9, 10));
    var segundoDigito = int.parse(cpfSemMascara.substring(10, 11));

    if (primeiroDigito != isFirtsDigitValid(cpf)) {
      Exception('Primeiro dígito não corresponde');
    }

    if (segundoDigito != isSecondDigitValid(cpf)) {
      throw Exception('Segundo  dígito não corresponde');
    }

    return true;
  }

  bool isCnpjValid(String cnpj) {
    return CnpjValidator.validateCnpj(cnpj);
  }
}
