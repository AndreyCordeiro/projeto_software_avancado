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
}
