class CnpjValidator {
  static bool validateCnpj(String cnpj) {
    if (!cnpj.contains('.')) return false;
    if (!cnpj.contains('-')) return false;
    if (!cnpj.contains('/')) return false;
    if (cnpj.length != 14) return false;

    var cpfSemMascara =
        cnpj.replaceAll('.', '').replaceAll('-', '').replaceAll('/', '');

    var cpfListaNumeros = cpfSemMascara
        .substring(0, 12)
        .split('')
        .map<int>((e) => int.parse(e))
        .toList();

    var isNumerosIguais = true;
    var primeiroDigito = int.parse(cpfSemMascara.substring(12, 13));
    var segundoDigito = int.parse(cpfSemMascara.substring(13, 14));

    for (var i = 1; i < cpfListaNumeros.length; i++) {
      if (cpfListaNumeros[i - 1] != cpfListaNumeros[i]) {
        isNumerosIguais = false;
        break;
      }
    }

    if (isNumerosIguais) return false;

    var peso = 5;
    var digitoCalculado = 0;

    for (var n in cpfListaNumeros) {
      digitoCalculado += peso * n;
      peso--;

      if (peso == 1) {
        peso = 9;
      }
    }

    digitoCalculado = 11 - (digitoCalculado % 11);

    if (digitoCalculado > 9) digitoCalculado = 0;
    if (primeiroDigito != digitoCalculado) return false;

    cpfListaNumeros.add(digitoCalculado);

    peso = 6;
    digitoCalculado = 0;

    for (var n in cpfListaNumeros) {
      digitoCalculado += peso * n;
      peso--;

      if (peso == 1) {
        peso = 9;
      }
    }

    digitoCalculado = 11 - (digitoCalculado % 11);

    if (digitoCalculado > 9) digitoCalculado = 0;
    if (segundoDigito != digitoCalculado) return false;

    return true;
  }
}
